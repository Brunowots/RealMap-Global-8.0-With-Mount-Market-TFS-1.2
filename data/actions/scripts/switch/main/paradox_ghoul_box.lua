function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then
doCreateItem(1739,1,{x=32479, y=31901, z=5})
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"The switch seems to be stuck.")
end
return TRUE
end