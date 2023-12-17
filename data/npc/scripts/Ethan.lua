local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:addModule(FocusModule:new())


keywordHandler:addSpellKeyword({'cancel','invisibility'}, {npcHandler = npcHandler, spellName = 'Cancel Invisibility', price = 1600, level = 26, vocation ={3}})
keywordHandler:addSpellKeyword({'conjure','arrow'}, {npcHandler = npcHandler, spellName = 'Conjure Arrow', price = 450, level = 13, vocation ={3}})
keywordHandler:addSpellKeyword({'conjure','bolt'}, {npcHandler = npcHandler, spellName = 'Conjure Bolt', price = 750, level = 17, vocation ={3}})
keywordHandler:addSpellKeyword({'conjure','explosive','arrow'}, {npcHandler = npcHandler, spellName = 'Conjure Explosive Arrow', price = 1000, level = 25, vocation ={3}})
keywordHandler:addSpellKeyword({'conjure','piercing','bolt'}, {npcHandler = npcHandler, spellName = 'Conjure Piercing Bolt', price = 850, level = 33, vocation ={3}})
keywordHandler:addSpellKeyword({'conjure','poisoned','arrow'}, {npcHandler = npcHandler, spellName = 'Conjure Poisoned Arrow', price = 700, level = 16, vocation ={3}})
keywordHandler:addSpellKeyword({'conjure','sniper','arrow'}, {npcHandler = npcHandler, spellName = 'Conjure Sniper Arrow', price = 800, level = 24, vocation ={3}})
keywordHandler:addSpellKeyword({'cure','poison'}, {npcHandler = npcHandler, spellName = 'Cure Poison', price = 150, level = 10, vocation ={3}})
keywordHandler:addSpellKeyword({'destroy','field'}, {npcHandler = npcHandler, spellName = 'Destroy Field', price = 700, level = 17, vocation ={3}})
keywordHandler:addSpellKeyword({'divine','caldera'}, {npcHandler = npcHandler, spellName = 'Divine Caldera', price = 3000, level = 50, vocation ={3}})
keywordHandler:addSpellKeyword({'divine','healing'}, {npcHandler = npcHandler, spellName = 'Divine Healing', price = 3000, level = 35, vocation ={3}})
keywordHandler:addSpellKeyword({'divine','missile'}, {npcHandler = npcHandler, spellName = 'Divine Missile', price = 1800, level = 40, vocation ={3}})
keywordHandler:addSpellKeyword({'enchant','spear'}, {npcHandler = npcHandler, spellName = 'Enchant Spear', price = 2000, level = 45, vocation ={3}})
keywordHandler:addSpellKeyword({'ethereal','spear'}, {npcHandler = npcHandler, spellName = 'Ethereal Spear', price = 1100, level = 23, vocation ={3}})
keywordHandler:addSpellKeyword({'find','person'}, {npcHandler = npcHandler, spellName = 'Find Person', price = 80, level = 8, vocation ={3}})
keywordHandler:addSpellKeyword({'great','light'}, {npcHandler = npcHandler, spellName = 'Great Light', price = 500, level = 13, vocation ={3}})
keywordHandler:addSpellKeyword({'haste'}, {npcHandler = npcHandler, spellName = 'Haste', price = 600, level = 14, vocation ={3}})
keywordHandler:addSpellKeyword({'holy','missile'}, {npcHandler = npcHandler, spellName = 'Holy Missile', price = 1600, level = 27, vocation ={3}})
keywordHandler:addSpellKeyword({'intense','healing'}, {npcHandler = npcHandler, spellName = 'Intense Healing', price = 350, level = 20, vocation ={3}})
keywordHandler:addSpellKeyword({'levitate'}, {npcHandler = npcHandler, spellName = 'Levitate', price = 500, level = 12, vocation ={3}})
keywordHandler:addSpellKeyword({'light'}, {npcHandler = npcHandler, spellName = 'Light', price = 0, level = 8, vocation ={3}})
keywordHandler:addSpellKeyword({'light','healing'}, {npcHandler = npcHandler, spellName = 'Light Healing', price = 0, level = 8, vocation ={3}})
keywordHandler:addSpellKeyword({'magic','rope'}, {npcHandler = npcHandler, spellName = 'Magic Rope', price = 200, level = 9, vocation ={3}})
keywordHandler:addSpellKeyword({'summon','emberwing'}, {npcHandler = npcHandler, spellName = 'Summon Emberwing', price = 50000, level = 200, vocation ={3}})
keywordHandler:addKeyword({'attack', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Divine Caldera}', '{Divine Missile}' and '{Ethereal Spear}'."})
keywordHandler:addKeyword({'healing', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Cure Poison}', '{Divine Healing}', '{Intense Healing}' and '{Light Healing}'."})
keywordHandler:addKeyword({'support', 'spells'}, StdModule.say, {npcHandler = npcHandler, text = "In this category I have '{Cancel Invisibility}', '{Conjure Arrow}', '{Conjure Bolt}', '{Conjure Explosive Arrow}', '{Conjure Piercing Bolt}', '{Conjure Poisoned Arrow}', '{Conjure Sniper Arrow}', '{Destroy Field}', '{Enchant Spear}', '{Find Person}', '{Great Light}', '{Haste}', '{Holy Missile}', '{Levitate}', '{Light}', '{Magic Rope}' and '{Summon Emberwing}'."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, text = 'I can teach you {Attack spells}, {Healing spells} and {Support spells}.'})