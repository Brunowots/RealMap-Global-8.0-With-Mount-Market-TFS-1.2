function onLogin(cid)
local outfitf = {lookType = 136 , lookHead =  getCreatureOutfit(cid).lookHead, lookBody =  getCreatureOutfit(cid).lookBody, lookLegs =  getCreatureOutfit(cid).lookLegs, lookFeet =  getCreatureOutfit(cid).lookFeet}
local outfitm = {lookType = 128 , lookHead =  getCreatureOutfit(cid).lookHead, lookBody =  getCreatureOutfit(cid).lookBody, lookLegs =  getCreatureOutfit(cid).lookLegs, lookFeet =  getCreatureOutfit(cid).lookFeet}

if isPremium(cid) == false and getCreatureOutfit(cid).lookType == 132 then
doCreatureChangeOutfit(cid, outfitm)
elseif isPremium(cid) == false and getCreatureOutfit(cid).lookType == 133 then
doCreatureChangeOutfit(cid, outfitm)
elseif isPremium(cid) == false and getCreatureOutfit(cid).lookType == 134 then
doCreatureChangeOutfit(cid, outfitm)
elseif isPremium(cid) == false and getCreatureOutfit(cid).lookType == 140 then
doCreatureChangeOutfit(cid, outfitf)
elseif isPremium(cid) == false and getCreatureOutfit(cid).lookType == 141 then
doCreatureChangeOutfit(cid, outfitf)
elseif isPremium(cid) == false and getCreatureOutfit(cid).lookType == 142 then
doCreatureChangeOutfit(cid, outfitf)
end
return true
end