local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:addModule(FocusModule:new())


	keywordHandler:addSpellKeyword({'conjure','bolt'}, {npcHandler = npcHandler, spellName = 'Conjure Bolt', price = 750, level = 17, vocation ={3}})
	keywordHandler:addSpellKeyword({'conjure','piercing','bolt'}, {npcHandler = npcHandler, spellName = 'Conjure Piercing Bolt', price = 850, level = 33, vocation ={3}})
	keywordHandler:addSpellKeyword({'conjure','poisoned','arrow'}, {npcHandler = npcHandler, spellName = 'Conjure Poisoned Arrow', price = 700, level = 16, vocation ={3}})
	keywordHandler:addSpellKeyword({'conjure','sniper','arrow'}, {npcHandler = npcHandler, spellName = 'Conjure Sniper Arrow', price = 800, level = 24, vocation ={3}})
	keywordHandler:addSpellKeyword({'enchant','party'}, {npcHandler = npcHandler, spellName = 'Enchant Party', price = 4000, level = 32, vocation ={1,2,3,4}})
	keywordHandler:addSpellKeyword({'heal','party'}, {npcHandler = npcHandler, spellName = 'Heal Party', price = 4000, level = 32, vocation ={1,2,3,4}})
	keywordHandler:addSpellKeyword({'protect','party'}, {npcHandler = npcHandler, spellName = 'Protect Party', price = 4000, level = 32, vocation ={1,2,3,4}})
	keywordHandler:addSpellKeyword({'train','party'}, {npcHandler = npcHandler, spellName = 'Train Party', price = 4000, level = 32, vocation ={1,2,3,4}})
	keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Conjure Bolt}', '{Conjure Piercing Bolt}', '{Conjure Poisoned Arrow}', '{Conjure Sniper Arrow}', '{Enchant Party}', '{Heal Party}', '{Protect Party}' and '{Train Party}'."})
	keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {Support spells}.'})
	
	
	