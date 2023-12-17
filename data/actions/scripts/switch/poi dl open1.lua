function onUse(cid, item, frompos, item2, topos)

tpto = {x=32813, y=32334, z=11, stackpos=1}

stonepos = {x=32808, y=32333, z=11, stackpos=1}
getstone = getThingfromPos(stonepos)

gatepos1 = {x=32809, y=32333, z=11, stackpos=253}
gatepos2 = {x=32810, y=32333, z=11, stackpos=1}
gatepos3 = {x=32811, y=32333, z=11, stackpos=1}

gatepos4 = {x=32808, y=32334, z=11, stackpos=1}
gatepos5 = {x=32809, y=32334, z=11, stackpos=1}
gatepos6 = {x=32810, y=32334, z=11, stackpos=1}
gatepos7 = {x=32811, y=32334, z=11, stackpos=1}
gatepos8 = {x=32812, y=32334, z=11, stackpos=1}

gatepos9 = {x=32807, y=32335, z=11, stackpos=1}
gatepos10 = {x=32808, y=32335, z=11, stackpos=1}
gatepos11 = {x=32809, y=32335, z=11, stackpos=1}
gatepos12 = {x=32810, y=32335, z=11, stackpos=1}
gatepos13 = {x=32811, y=32335, z=11, stackpos=1}

gatepos14 = {x=32807, y=32336, z=11, stackpos=1}
gatepos15 = {x=32808, y=32336, z=11, stackpos=1}
gatepos16 = {x=32809, y=32336, z=11, stackpos=1}
gatepos17 = {x=32810, y=32336, z=11, stackpos=1}
gatepos18 = {x=32811, y=32336, z=11, stackpos=1}

gatepos19 = {x=32805, y=32337, z=11, stackpos=1}
gatepos20 = {x=32806, y=32337, z=11, stackpos=1}
gatepos21 = {x=32807, y=32337, z=11, stackpos=1}
gatepos22 = {x=32808, y=32337, z=11, stackpos=1}
gatepos23 = {x=32809, y=32337, z=11, stackpos=1}
gatepos24 = {x=32810, y=32337, z=11, stackpos=1}
gatepos25 = {x=32811, y=32337, z=11, stackpos=1}

gatepos26 = {x=32805, y=32338, z=11, stackpos=1}
gatepos27 = {x=32806, y=32338, z=11, stackpos=1}
gatepos28 = {x=32807, y=32338, z=11, stackpos=1}
gatepos29 = {x=32808, y=32338, z=11, stackpos=1}
gatepos30 = {x=32809, y=32338, z=11, stackpos=1}
gatepos31 = {x=32810, y=32338, z=11, stackpos=1}
gatepos32 = {x=32811, y=32338, z=11, stackpos=1}

gatepos33 = {x=32809, y=32339, z=11, stackpos=1}
gatepos34 = {x=32810, y=32339, z=11, stackpos=1}




if item.uid == 25301 and item.itemid == 1945 then
doCreateItem(103,1,gatepos1)
doCreateItem(103,1,gatepos2)
doCreateItem(103,1,gatepos3)
doCreateItem(103,1,gatepos4)
doCreateItem(103,1,gatepos5)
doCreateItem(103,1,gatepos6)
doCreateItem(103,1,gatepos7)
doCreateItem(103,1,gatepos8)
doCreateItem(103,1,gatepos9)
doCreateItem(103,1,gatepos10)
doCreateItem(103,1,gatepos11)
doCreateItem(103,1,gatepos12)
doCreateItem(103,1,gatepos13)
doCreateItem(103,1,gatepos14)
doCreateItem(103,1,gatepos15)
doCreateItem(103,1,gatepos16)
doCreateItem(103,1,gatepos17)
doCreateItem(103,1,gatepos18)
doCreateItem(103,1,gatepos19)
doCreateItem(103,1,gatepos20)
doCreateItem(103,1,gatepos21)
doCreateItem(103,1,gatepos22)
doCreateItem(103,1,gatepos23)
doCreateItem(103,1,gatepos24)
doCreateItem(103,1,gatepos25)
doCreateItem(103,1,gatepos26)
doCreateItem(103,1,gatepos27)
doCreateItem(103,1,gatepos28)
doCreateItem(103,1,gatepos29)
doCreateItem(103,1,gatepos30)
doCreateItem(103,1,gatepos31)
doCreateItem(103,1,gatepos32)
doCreateItem(103,1,gatepos33)
doCreateItem(103,1,gatepos34)

doRemoveItem(getstone.uid,1)
doTransformItem(item.uid,item.itemid+1)
		doPlayerSendTextMessage(cid,22,"You have now opened Dragon Lord Hell!")
elseif item.uid == 25301 and item.itemid == 1946 then
teleport1 = getThingfromPos(gatepos1)
teleport2 = getThingfromPos(gatepos2)
teleport3 = getThingfromPos(gatepos3)
teleport4 = getThingfromPos(gatepos4)
teleport5 = getThingfromPos(gatepos5)
teleport6 = getThingfromPos(gatepos6)
teleport7 = getThingfromPos(gatepos7)
teleport8 = getThingfromPos(gatepos8)
teleport9 = getThingfromPos(gatepos9)
teleport10 = getThingfromPos(gatepos10)
teleport11 = getThingfromPos(gatepos11)
teleport12 = getThingfromPos(gatepos12)
teleport13 = getThingfromPos(gatepos13)
teleport14 = getThingfromPos(gatepos14)
teleport15 = getThingfromPos(gatepos15)
teleport16 = getThingfromPos(gatepos16)
teleport17 = getThingfromPos(gatepos17)
teleport18 = getThingfromPos(gatepos18)
teleport19 = getThingfromPos(gatepos19)
teleport20 = getThingfromPos(gatepos20)
teleport21 = getThingfromPos(gatepos21)
teleport22 = getThingfromPos(gatepos22)
teleport23 = getThingfromPos(gatepos23)
teleport24 = getThingfromPos(gatepos24)
teleport25 = getThingfromPos(gatepos25)
teleport26 = getThingfromPos(gatepos26)
teleport27 = getThingfromPos(gatepos27)
teleport28 = getThingfromPos(gatepos28)
teleport29 = getThingfromPos(gatepos29)
teleport30 = getThingfromPos(gatepos30)
teleport31 = getThingfromPos(gatepos31)
teleport32 = getThingfromPos(gatepos32)
teleport33 = getThingfromPos(gatepos33)
teleport34 = getThingfromPos(gatepos34)
doTeleportThing(teleport1.uid,tpto)
doTeleportThing(teleport2.uid,tpto)
doTeleportThing(teleport3.uid,tpto)
doTeleportThing(teleport4.uid,tpto)
doTeleportThing(teleport5.uid,tpto)
doTeleportThing(teleport6.uid,tpto)
doTeleportThing(teleport7.uid,tpto)
doTeleportThing(teleport8.uid,tpto)
doTeleportThing(teleport9.uid,tpto)
doTeleportThing(teleport10.uid,tpto)
doTeleportThing(teleport11.uid,tpto)
doTeleportThing(teleport12.uid,tpto)
doTeleportThing(teleport13.uid,tpto)
doTeleportThing(teleport14.uid,tpto)
doTeleportThing(teleport15.uid,tpto)
doTeleportThing(teleport16.uid,tpto)
doTeleportThing(teleport17.uid,tpto)
doTeleportThing(teleport18.uid,tpto)
doTeleportThing(teleport19.uid,tpto)
doTeleportThing(teleport20.uid,tpto)
doTeleportThing(teleport21.uid,tpto)
doTeleportThing(teleport22.uid,tpto)
doTeleportThing(teleport23.uid,tpto)
doTeleportThing(teleport24.uid,tpto)
doTeleportThing(teleport25.uid,tpto)
doTeleportThing(teleport26.uid,tpto)
doTeleportThing(teleport27.uid,tpto)
doTeleportThing(teleport28.uid,tpto)
doTeleportThing(teleport29.uid,tpto)
doTeleportThing(teleport30.uid,tpto)
doTeleportThing(teleport31.uid,tpto)
doTeleportThing(teleport32.uid,tpto)
doTeleportThing(teleport33.uid,tpto)
doTeleportThing(teleport34.uid,tpto)
 
doCreateItem(1304,1,stonepos)
doCreateItem(598,1,gatepos1)
doCreateItem(598,1,gatepos2)
doCreateItem(598,1,gatepos3)
doCreateItem(598,1,gatepos4)
doCreateItem(598,1,gatepos5)
doCreateItem(598,1,gatepos6)
doCreateItem(598,1,gatepos7)
doCreateItem(598,1,gatepos8)
doCreateItem(598,1,gatepos9)
doCreateItem(598,1,gatepos10)
doCreateItem(598,1,gatepos11)
doCreateItem(598,1,gatepos12)
doCreateItem(598,1,gatepos13)
doCreateItem(598,1,gatepos14)
doCreateItem(598,1,gatepos15)
doCreateItem(598,1,gatepos16)
doCreateItem(598,1,gatepos17)
doCreateItem(598,1,gatepos18)
doCreateItem(598,1,gatepos19)
doCreateItem(598,1,gatepos20)
doCreateItem(598,1,gatepos21)
doCreateItem(598,1,gatepos22)
doCreateItem(598,1,gatepos23)
doCreateItem(598,1,gatepos24)
doCreateItem(598,1,gatepos25)
doCreateItem(598,1,gatepos26)
doCreateItem(598,1,gatepos27)
doCreateItem(598,1,gatepos28)
doCreateItem(598,1,gatepos29)
doCreateItem(598,1,gatepos30)
doCreateItem(598,1,gatepos31)
doCreateItem(598,1,gatepos32)
doCreateItem(598,1,gatepos33)
doCreateItem(598,1,gatepos34)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end