-- Vendendo Vials por use by warcraftzz

----- Configurações -----
local config = {
       cost = 5, -- Dinheiro que ganhara por cada vial vendido DEFAULT 5GPS
       item_id = 2006, -- ID DO VIAL
       gold_id = 2148, -- ID DO GOLD COIN QUE É 2148 DIGITE 2160 PARA CRYSTAL COIN
}
function onUse(cid, item, frompos, item2, topos)
local count = getPlayerItemCount(cid,7636)
doPlayerRemoveItem(cid,config.item_id,count)
doPlayerAddItem(cid,config.gold_id,config.cost*count)
doPlayerSendTextMessage(cid,22,"Você vendeu ".. config.count .."")
doSendMagicEffect(frompos, 4)
end