local colors = {94, 81, 79, 88, 18, 11, 92, 128}
local storage = 65535
local time = 10 --in miliseconds


function onSay(cid, words, param, channel)


if(param == "on") then
if getPlayerStorageValue(cid, storage) < 1 then
if doPlayerRemoveMoney(cid, 0) == TRUE then
local event = addEvent(changeOutfit, time, cid)
setPlayerStorageValue(cid, storage, 1)
return TRUE
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have enough money.")
return TRUE
end
else
return TRUE
end
elseif(param == "off") then
if getPlayerStorageValue(cid, storage) > 0 then
setPlayerStorageValue(cid, storage, 0)
return TRUE
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have rainbow outfit on.")
return TRUE
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Use !rainbow on-off.")
return TRUE
end
return TRUE
end


function changeOutfit(cid)


local randomHead = colors[math.random(#colors)]
local randomLegs = colors[math.random(#colors)]
local randomBody = colors[math.random(#colors)]
local randomFeet = colors[math.random(#colors)]
local tmp = {}


if getPlayerStorageValue(cid, storage) > 0 then
local outfit = getCreatureOutfit(cid)
tmp = outfit
tmp.lookType = outfit.lookType
tmp.lookHead = randomHead
tmp.lookLegs = randomLegs
tmp.lookBody = randomBody
tmp.lookFeet = randomFeet
tmp.lookAddons = outfit.lookAddons


doCreatureChangeOutfit(cid, tmp)
local event = addEvent(repeatChangeOutfit, time, cid)
return TRUE
else
stopEvent(event)
return TRUE
end
end


function repeatChangeOutfit(cid)


local randomHead = colors[math.random(#colors)]
local randomLegs = colors[math.random(#colors)]
local randomBody = colors[math.random(#colors)]
local randomFeet = colors[math.random(#colors)]
local tmp = {}


if getPlayerStorageValue(cid, storage) > 0 then
local outfit = getCreatureOutfit(cid)
tmp = outfit
tmp.lookType = outfit.lookType
tmp.lookHead = randomHead
tmp.lookLegs = randomLegs
tmp.lookBody = randomBody
tmp.lookFeet = randomFeet
tmp.lookAddons = outfit.lookAddons


doCreatureChangeOutfit(cid, tmp)
local event = addEvent(changeOutfit, time, cid)
return TRUE
else
stopEvent(event)
return TRUE
end
end