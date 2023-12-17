local pos = {x = 33297, y = 31677, z = 15}
local wall = 1355
local seconds = 600 -- use 0 to disable
local event = 0

local function reset(leverPos)
        local lever = getTileItemById(leverPos, 1946).uid
		doTransformItem(lever, 1945)
		doCreateItem(wall, 1, pos)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)

	  if item.uid == 25281 and item.itemid == 1945 then
			doRemoveItem(getTileItemById(pos,wall).uid)
			if seconds > 0 then
				event = addEvent(reset, seconds * 1000, getThingPos(item.uid))
			end
			doTransformItem(item.uid,item.itemid+1)
    elseif item.itemid == 1946 then
        stopEvent(event)
        doPlayerSendTextMessage(cid,21,"You have closed the pass!")
        doTransformItem(item.uid,item.itemid-1)
        doCreateItem(wall, 1, pos)
end
return true
end