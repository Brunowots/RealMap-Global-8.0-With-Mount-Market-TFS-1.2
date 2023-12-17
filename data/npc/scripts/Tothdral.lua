local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the foremost astrologer and supreme magus of this city."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Tothdral. They call me 'The Seeker Beyond the Grave'."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is your problem. It is no longer mine."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our temple is a centre of spirituality and learning. The temple and the serpentine tower work hand in hand for the good of all people, whether they are alive or undead."})
keywordHandler:addKeyword({'oldpharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He has been given a chance to ascend. I am sure he will feel nothing but thankfulness for this divine son, our revered pharaoh."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The immortal pharaoh is our god and our example. He alone holds the secrets that will save us all from the greedy grasp of the false gods."})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you know how to listen to them they will reveal ancient secrets to you."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This world is only a shadow of the worlds that have been. That was long ago, before the true gods fought each other in the godwars and the false gods rose to claim their heritage."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those cities that bow to the false gods will fall prey to their treacherous greed sooner or later."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those cities that bow to the false gods will fall prey to their treacherous greed sooner or later."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those cities that bow to the false gods will fall prey to their treacherous greed sooner or later."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those cities that bow to the false gods will fall prey to their treacherous greed sooner or later."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves should have learned their lessons, but these boneheaded fools still don't see there is only one way to escape the false gods' grasp."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves should have learned their lessons, but these boneheaded fools still don't see there is only one way to escape the false gods' grasp."})
keywordHandler:addKeyword({'dwarv'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves should have learned their lessons, but these boneheaded fools still don't see there is only one way to escape the false gods' grasp."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are nothing but idle riff-raff. They embrace the vain amusements of physical pleasure. Eternal damnation will be their lot."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are nothing but idle riff-raff. They embrace the vain amusements of physical pleasure. Eternal damnation will be their lot."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He was so close. ... and still he failed to draw the right conclusions."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This continent is mostly free from the servants of the false gods. Those who live here may hope to become worthy one day of the first steps towards ascension."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Their foolishness is great, but perhaps they still can be saved. If only they listened and accepted the next step to ascension."})
keywordHandler:addKeyword({'next step'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Undeath alone will rid you of the temptations that blur your vision of the true path."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This city is as old as the sands that surround it, and it is built on previous settlements that date back even further in time. Perhaps only the wise scarabs know the full story of this place."})
keywordHandler:addKeyword({'mortality'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mortality is your curse. When you are worthy the burden of mortality will be taken from your shoulders."})
keywordHandler:addKeyword({'false'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The self-styled gods were nothing but minor servants of the true gods. They steal the soul of any mortal foolish enough to believe in them. They plan to use the stolen souls to ascend to true godhood."})
keywordHandler:addKeyword({'godswar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This war brought about the end of the true universe. That which is left now is but a shadow of former glories, a bleak remainder of what once was. The true gods perished and their essence was dispersed throughout the remaining universe."})
keywordHandler:addKeyword({'great suffering'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The great suffering is a phase of steady decline that will end eventually in void and emptiness unless some divine power such as our pharaoh will reverse it. Mend your ways and follow him! Perhaps you will be chosen to join him in his noble struggle."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The essence of the true gods is omnipresent in the universe. We all share this divine heritage, for every single one of us carries the divine spark inside him. This is the reason we all have a chance to ascend to godhood, too."})
keywordHandler:addKeyword({"Akh'rah Uthun"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Akh'rah Uthun is the trinity of existence, the three that are one. The Akh, the shell, the Rah, the source of power, and the Uthun, our consciousness, form this union."})
keywordHandler:addKeyword({"steal souls"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The false gods harvest the souls of the dead to secure their stolen powers and status."})
keywordHandler:addKeyword({'Akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Akh is a tool. As long as it is alive it is a burden and source of weakness, but if you ascend to undeath it becomes a useful tool that can be used to work towards greater ends."})
keywordHandler:addKeyword({'undea'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Undeath is an improvement. It is the gateway to goals that are nobler than eating, drinking or other fulfilments of trivial physical needs.."})
keywordHandler:addKeyword({'Rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Rah is what the ignorant might call the soul. But it's more than that. It is the divine spark in all of us, the source of energy that keeps us alive."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Uthun is the part of the trinity that is easiest to form. It consists of our recollections of the past and of our thoughts. It is that which determines who we are in this world and it gives us guidance throughout our existence."})
keywordHandler:addKeyword({'mourn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dead mourn the living because they are weak and excluded from ascension."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The arena is a suitable distraction for the Uthun of the mortals. It might even serve as a place for them to prove their worth. If they pass the test they may be freed of their mortal shells."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The residence of the pharaoh should be worshipped just as the pharaoh is worshipped. Don't enter until you have business there."})

npcHandler:addModule(FocusModule:new())