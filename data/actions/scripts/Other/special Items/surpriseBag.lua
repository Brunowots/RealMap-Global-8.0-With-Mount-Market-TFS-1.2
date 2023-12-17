
-- 2687    Cooki
-- 7620    Mana Potion
-- 24774   Tibia Coin
-- 6574    Chocolate bar
-- 2168    life ring
-- 2152    platinium coin
-- 7618    life potion
-- 2114    Pig Bank
-- 2169    time ring
-- 2167    energy ring
-- 2165    stealth ring
-- 6300    death ring
-- 2153    Violet Gem
-- 5944    Soul Orbe
-- 2112    Teaddy Bear
-- 6568    Panda Teaddy
-- 6566    stuffed dragon.
-- 2492    DSM
-- 2520    demon shield
-- 2195    BOH
-- 2392    fire sword
-- 2487    Crown armor
-- 2488    Crwon legs
-- 2498    Royal Helmet
-- 2516    Dragon shield


local config = {
	[6570] = { -- bluePresent
		{2687, 10}, {7620, 10}, 24774, 6574, 2168, {2152, 10}, {7618, 10}, 2114, 2169, 2167, 2165, 6300, 2516
	},
	[6571] = { -- redPresent
		2153, 5944, 2112, 6568, 6566, 2492, 2520, 2195, 2114, {2152, 10}, 2168, 6574, 24774, 2392, 2487, 2488, 2498,36189, 36190
	},
	[9108] = { -- surpriseBag
		{2148, 10}, 7487, 2114, 8072, 7735, 8110, 6574, {2152, 10}, 7377, 2667, 9693
	},
	[16094] = { -- surpriseBag
		{2148, 10}, 7487, 2114, 8072, 7735, 8110, 6574, {2152, 10}, 7377, 2667, 9693
	},
	[16102] = { -- surpriseBag
		{2148, 10}, 7487, 2114, 8072, 7735, 8110, 6574, {2152, 10}, 7377, 2667, 9693
	},
	[35143] = { -- surpriseBag Special
		35228, 35229, 35230, 35231, 35232, 35233, 35234, 35235, 36466, 36416, 36415, 36449, 36452, 36191
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local present = config[item.itemid]
	if not present then
		return false
	end

	local count = 1
	local gift = present[math.random(1, #present)]
	if type(gift) == "table" then
		count = gift[2]
		gift = gift[1]
	end

	Player(cid):addItem(gift, count)
	Item(item.uid):remove(1)
	fromPosition:sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end
