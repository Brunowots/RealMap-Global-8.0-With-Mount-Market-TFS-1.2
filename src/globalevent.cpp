/**
 * The Forgotten Server D - a free and open-source MMORPG server emulator
 * Copyright (C) 2017  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "configmanager.h"
#include "globalevent.h"
#include "tools.h"
#include "scheduler.h"
#include "pugicast.h"

extern ConfigManager g_config;

GlobalEvents::GlobalEvents() :
	scriptInterface("GlobalEvent Interface")
{
	scriptInterface.initState();
}

GlobalEvents::~GlobalEvents()
{
	clear();
}

void GlobalEvents::clearMap(GlobalEventMap& map)
{
	#pragma omp parallel for
for (const auto& it : map) {
		delete it.second;
	}
	map.clear();
}

void GlobalEvents::clear()
{
	g_scheduler.stopEvent(thinkEventId);
	thinkEventId = 0;
	g_scheduler.stopEvent(timerEventId);
	timerEventId = 0;

	clearMap(thinkMap);
	clearMap(serverMap);
	clearMap(timerMap);

	scriptInterface.reInitState();
}

Event* GlobalEvents::getEvent(const std::string& nodeName)
{
	if (strcasecmp(nodeName.c_str(), "globalevent") != 0) {
		return nullptr;
	}
	return new GlobalEvent(&scriptInterface);
}

bool GlobalEvents::registerEvent(Event* event, const pugi::xml_node&)
{
	GlobalEvent* globalEvent = static_cast<GlobalEvent*>(event); //event is guaranteed to be a GlobalEvent
	if (globalEvent->getEventType() == GLOBALEVENT_TIMER) {
		auto result = timerMap.emplace(globalEvent->getName(), globalEvent);
		if (result.second) {
			if (timerEventId == 0) {
				timerEventId = g_scheduler.addEvent(createSchedulerTask(SCHEDULER_MINTICKS, std::bind(&GlobalEvents::timer, this)));
			}
			return true;
		}
	} else if (globalEvent->getEventType() != GLOBALEVENT_NONE) {
		auto result = serverMap.emplace(globalEvent->getName(), globalEvent);
		if (result.second) {
			return true;
		}
	} else { // think event
		auto result = thinkMap.emplace(globalEvent->getName(), globalEvent);
		if (result.second) {
			if (thinkEventId == 0) {
				thinkEventId = g_scheduler.addEvent(createSchedulerTask(SCHEDULER_MINTICKS, std::bind(&GlobalEvents::think, this)));
			}
			return true;
		}
	}

	std::cout << "[Warning - GlobalEvents::configureEvent] Duplicate registered globalevent with name: " << globalEvent->getName() << std::endl;
	return false;
}


bool GlobalEvents::registerLuaEvent(GlobalEvent* event)
{
	GlobalEvent* globalEvent = static_cast<GlobalEvent*>(event); 
	if (globalEvent->getEventType() == GLOBALEVENT_TIMER) {
		auto result = timerMap.emplace(globalEvent->getName(), globalEvent);
		if (result.second) {
			if (timerEventId == 0) {
				timerEventId = g_scheduler.addEvent(createSchedulerTask(SCHEDULER_MINTICKS, std::bind(&GlobalEvents::timer, this)));
			}
			return true;
		}
	} else if (globalEvent->getEventType() != GLOBALEVENT_NONE) {
		auto result = serverMap.emplace(globalEvent->getName(), globalEvent);
		if (result.second) {
			return true;
		}
	} else { // think event
		auto result = thinkMap.emplace(globalEvent->getName(), globalEvent);
		if (result.second) {
			if (thinkEventId == 0) {
				thinkEventId = g_scheduler.addEvent(createSchedulerTask(SCHEDULER_MINTICKS, std::bind(&GlobalEvents::think, this)));
			}
			return true;
		}
	}

	std::cout << "[Warning - GlobalEvents::configureEvent] Duplicate registered globalevent with name: " << globalEvent->getName() << std::endl;
	return false;
}

void GlobalEvents::startup() const
{
	execute(GLOBALEVENT_STARTUP);
}

void GlobalEvents::timer()
{
	time_t now = time(nullptr);

	int64_t nextScheduledTime = std::numeric_limits<int64_t>::max();

	auto it = timerMap.begin();
	while (it != timerMap.end()) {
		GlobalEvent* globalEvent = it->second;

		int64_t nextExecutionTime = globalEvent->getNextExecution() - now;
		if (nextExecutionTime > 0) {
			if (nextExecutionTime < nextScheduledTime) {
				nextScheduledTime = nextExecutionTime;
			}

			++it;
			continue;
		}

		if (!globalEvent->executeEvent()) {
			it = timerMap.erase(it);
			continue;
		}

		nextExecutionTime = 86400;
		if (nextExecutionTime < nextScheduledTime) {
			nextScheduledTime = nextExecutionTime;
		}

		globalEvent->setNextExecution(globalEvent->getNextExecution() + nextExecutionTime);

		++it;
	}

	if (nextScheduledTime != std::numeric_limits<int64_t>::max()) {
		timerEventId = g_scheduler.addEvent(createSchedulerTask(std::max<int64_t>(1000, nextScheduledTime * 1000),
											std::bind(&GlobalEvents::timer, this)));
	}
}

void GlobalEvents::think()
{
	int64_t now = OTSYS_TIME();
	int64_t nextScheduledTime = std::numeric_limits<int64_t>::max();

	std::vector<GlobalEvent*> eventsToExecute;

	#pragma omp parallel for
	for (const auto& it : thinkMap) {
		GlobalEvent* globalEvent = it.second;

		int64_t nextExecutionTime = globalEvent->getNextExecution() - now;
		if (nextExecutionTime <= 0) {
			eventsToExecute.push_back(globalEvent);
			nextExecutionTime = globalEvent->getInterval();
		}

		#pragma omp critical
		{
			if (nextExecutionTime < nextScheduledTime) {
				nextScheduledTime = nextExecutionTime;
			}
		}
	}

	for (GlobalEvent* globalEvent : eventsToExecute) {
		if (!globalEvent->executeEvent()) {
			std::cout << "[Error - GlobalEvents::think] Failed to execute event: " << globalEvent->getName() << std::endl;
		}

		int64_t nextExecutionTime = globalEvent->getInterval();
		#pragma omp critical
		{
			if (nextExecutionTime < nextScheduledTime) {
				nextScheduledTime = nextExecutionTime;
			}
			globalEvent->setNextExecution(globalEvent->getNextExecution() + nextExecutionTime);
		}
	}

	if (nextScheduledTime != std::numeric_limits<int64_t>::max()) {
		thinkEventId = g_scheduler.addEvent(createSchedulerTask(nextScheduledTime, std::bind(&GlobalEvents::think, this)));
	}
}

void GlobalEvents::execute(GlobalEvent_t type) const
{
	#pragma omp parallel for
for (const auto& it : serverMap) {
		GlobalEvent* globalEvent = it.second;
		if (globalEvent->getEventType() == type) {
			globalEvent->executeEvent();
		}
	}
}

GlobalEventMap GlobalEvents::getEventMap(GlobalEvent_t type)
{
	switch (type) {
		case GLOBALEVENT_NONE: return thinkMap;
		case GLOBALEVENT_TIMER: return timerMap;
		case GLOBALEVENT_STARTUP:
		case GLOBALEVENT_SHUTDOWN:
		case GLOBALEVENT_RECORD: {
			GlobalEventMap retMap;
			#pragma omp parallel for
for (const auto& it : serverMap) {
				if (it.second->getEventType() == type) {
					retMap[it.first] = it.second;
				}
			}
			return retMap;
		}
		default: return GlobalEventMap();
	}
}

GlobalEvent::GlobalEvent(LuaScriptInterface* interface) : Event(interface) {}

bool GlobalEvent::configureEvent(const pugi::xml_node& node)
{
	pugi::xml_attribute nameAttribute = node.attribute("name");
	if (!nameAttribute) {
		std::cout << "[Error - GlobalEvent::configureEvent] Missing name for a globalevent" << std::endl;
		return false;
	}

	name = nameAttribute.as_string();
	eventType = GLOBALEVENT_NONE;

	pugi::xml_attribute attr;
	if ((attr = node.attribute("time"))) {
		std::vector<int32_t> params = vectorAtoi(explodeString(attr.as_string(), ":"));

		int32_t hour = params.front();
		if (hour < 0 || hour > 23) {
			std::cout << "[Error - GlobalEvent::configureEvent] Invalid hour \"" << attr.as_string() << "\" for globalevent with name: " << name << std::endl;
			return false;
		}

		interval |= hour << 16;

		int32_t min = 0;
		int32_t sec = 0;
		if (params.size() > 1) {
			min = params[1];
			if (min < 0 || min > 59) {
				std::cout << "[Error - GlobalEvent::configureEvent] Invalid minute \"" << attr.as_string() << "\" for globalevent with name: " << name << std::endl;
				return false;
			}

			if (params.size() > 2) {
				sec = params[2];
				if (sec < 0 || sec > 59) {
					std::cout << "[Error - GlobalEvent::configureEvent] Invalid second \"" << attr.as_string() << "\" for globalevent with name: " << name << std::endl;
					return false;
				}
			}
		}

		time_t current_time = time(nullptr);
		tm* timeinfo = localtime(&current_time);
		timeinfo->tm_hour = hour;
		timeinfo->tm_min = min;
		timeinfo->tm_sec = sec;

		time_t difference = static_cast<time_t>(difftime(mktime(timeinfo), current_time));
		if (difference < 0) {
			difference += 86400;
		}

		nextExecution = current_time + difference;
		eventType = GLOBALEVENT_TIMER;
	} else if ((attr = node.attribute("type"))) {
		const char* value = attr.value();
		if (strcasecmp(value, "startup") == 0) {
			eventType = GLOBALEVENT_STARTUP;
		} else if (strcasecmp(value, "shutdown") == 0) {
			eventType = GLOBALEVENT_SHUTDOWN;
		} else if (strcasecmp(value, "record") == 0) {
			eventType = GLOBALEVENT_RECORD;
		} else {
			std::cout << "[Error - GlobalEvent::configureEvent] No valid type \"" << attr.as_string() << "\" for globalevent with name " << name << std::endl;
			return false;
		}
	} else if ((attr = node.attribute("interval"))) {
		interval = std::max<int32_t>(SCHEDULER_MINTICKS, pugi::cast<int32_t>(attr.value()));
		nextExecution = OTSYS_TIME() + interval;
	} else {
		std::cout << "[Error - GlobalEvent::configureEvent] No interval for globalevent with name " << name << std::endl;
		return false;
	}
	return true;
}

std::string GlobalEvent::getScriptEventName() const
{
	switch (eventType) {
		case GLOBALEVENT_STARTUP: return "onStartup";
		case GLOBALEVENT_SHUTDOWN: return "onShutdown";
		case GLOBALEVENT_RECORD: return "onRecord";
		case GLOBALEVENT_TIMER: return "onTime";
		default: return "onThink";
	}
}

bool GlobalEvent::executeRecord(uint32_t current, uint32_t old)
{
	//onRecord(current, old)
	if (!scriptInterface->reserveScriptEnv()) {
		std::cout << "[Error - GlobalEvent::executeRecord] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface->getScriptEnv();
	env->setScriptId(scriptId, scriptInterface);

	lua_State* L = scriptInterface->getLuaState();
	scriptInterface->pushFunction(scriptId);

	lua_pushnumber(L, current);
	lua_pushnumber(L, old);
	return scriptInterface->callFunction(2);
}

bool GlobalEvent::executeEvent()
{
	if (!scriptInterface->reserveScriptEnv()) {
		std::cout << "[Error - GlobalEvent::executeEvent] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface->getScriptEnv();
	env->setScriptId(scriptId, scriptInterface);
	lua_State* L = scriptInterface->getLuaState();
	scriptInterface->pushFunction(scriptId);

	int32_t params = 0;
	if (eventType == GLOBALEVENT_NONE || eventType == GLOBALEVENT_TIMER) {
		lua_pushnumber(L, interval);
		params = 1;
	}

	return scriptInterface->callFunction(params);
}
