/**
 * The Forgotten Server D - a free and open-source MMORPG server emulator
 * Copyright (C) 2017  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef FS_CONST_H_0A49B5996F074465BF44B90F4F780E8B
#define FS_CONST_H_0A49B5996F074465BF44B90F4F780E8B

static constexpr int32_t NETWORKMESSAGE_MAXSIZE = 65500;

enum MagicEffectClasses : uint8_t {
	CONST_ME_NONE,

	CONST_ME_DRAWBLOOD = 1,
	CONST_ME_LOSEENERGY = 2,
	CONST_ME_POFF = 3,
	CONST_ME_BLOCKHIT = 4,
	CONST_ME_EXPLOSIONAREA = 5,
	CONST_ME_EXPLOSIONHIT = 6,
	CONST_ME_FIREAREA = 7,
	CONST_ME_YELLOW_RINGS = 8,
	CONST_ME_GREEN_RINGS = 9,
	CONST_ME_HITAREA = 10,
	CONST_ME_TELEPORT = 11,
	CONST_ME_ENERGYHIT = 12,
	CONST_ME_MAGIC_BLUE = 13,
	CONST_ME_MAGIC_RED = 14,
	CONST_ME_MAGIC_GREEN = 15,
	CONST_ME_HITBYFIRE = 16,
	CONST_ME_HITBYPOISON = 17,
	CONST_ME_MORTAREA = 18,
	CONST_ME_SOUND_GREEN = 19,
	CONST_ME_SOUND_RED = 20,
	CONST_ME_POISONAREA = 21,
	CONST_ME_SOUND_YELLOW = 22,
	CONST_ME_SOUND_PURPLE = 23,
	CONST_ME_SOUND_BLUE = 24,
	CONST_ME_SOUND_WHITE = 25,
	CONST_ME_BUBBLES = 26,
	CONST_ME_CRAPS = 27,
	CONST_ME_GIFT_WRAPS = 28,
	CONST_ME_FIREWORK_YELLOW = 29,
	CONST_ME_FIREWORK_RED = 30,
	CONST_ME_FIREWORK_BLUE = 31,
	CONST_ME_STUN = 32,
	CONST_ME_SLEEP = 33,
	CONST_ME_WATERCREATURE = 34,
	CONST_ME_GROUNDSHAKER = 35,
	CONST_ME_HEARTS = 36,
	CONST_ME_FIREATTACK = 37,
	CONST_ME_ENERGYAREA = 38,
	CONST_ME_SMALLCLOUDS = 39,
	CONST_ME_HOLYDAMAGE = 40,
	CONST_ME_BIGCLOUDS = 41,
	CONST_ME_ICEAREA = 42,
	CONST_ME_ICETORNADO = 43,
	CONST_ME_ICEATTACK = 44,
	CONST_ME_STONES = 45,
	CONST_ME_SMALLPLANTS = 46,
	CONST_ME_CARNIPHILA = 47,
	CONST_ME_PURPLEENERGY = 48,
	CONST_ME_YELLOWENERGY = 49,
	CONST_ME_HOLYAREA = 50,
	CONST_ME_BIGPLANTS = 51,
	CONST_ME_CAKE = 52,
	CONST_ME_GIANTICE = 53,
	CONST_ME_WATERSPLASH = 54,
	CONST_ME_PLANTATTACK = 55,
	CONST_ME_TUTORIALARROW = 56,
	CONST_ME_TUTORIALSQUARE = 57,
	CONST_ME_MIRRORHORIZONTAL = 58,
	CONST_ME_MIRRORVERTICAL = 59,
	CONST_ME_SKULLHORIZONTAL = 60,
	CONST_ME_SKULLVERTICAL = 61,
	CONST_ME_ASSASSIN = 62,
	CONST_ME_STEPSHORIZONTAL = 63,
	CONST_ME_BLOODYSTEPS = 64,
	CONST_ME_STEPSVERTICAL = 65,
	CONST_ME_YALAHARIGHOST = 66,
	CONST_ME_BATS = 67,
	CONST_ME_SMOKE = 68,
	CONST_ME_INSECTS = 69,
    CONST_ME_DRAGONHEAD= 70,
    CONST_ME_ORCSHAMAN = 71,
	CONST_ME_ORCSHAMAN_FIRE = 72,
	CONST_ME_THUNDER = 73,
	CONST_ME_FERUMBRAS = 74,
	CONST_ME_CONFETTI_HORIZONTAL = 75,
	CONST_ME_CONFETTI_VERTICAL = 76,
	// 77-157 are empty
	CONST_ME_BLACKSMOKE = 158,
	// 159-166 are empty
	CONST_ME_REDSMOKE = 167,
	CONST_ME_YELLOWSMOKE = 168,
	CONST_ME_GREENSMOKE = 169,
	CONST_ME_PURPLESMOKE = 170,
	CONST_ME_EARLY_THUNDER = 171,
	CONST_ME_RAGIAZ_BONECAPSULE = 172,
	CONST_ME_CRITICAL_DAMAGE = 173,
	// 174 is empty
	CONST_ME_PLUNGING_FISH = 175,

	CONST_ME_BLUE_ENERGY_SPARK = 176,
	CONST_ME_ORANGE_ENERGY_SPARK = 177,
	CONST_ME_GREEN_ENERGY_SPARK = 178,
	CONST_ME_PINK_ENERGY_SPARK = 179,
	CONST_ME_WHITE_ENERGY_SPARK = 180,
	CONST_ME_YELLOW_ENERGY_SPARK = 181,
	CONST_ME_MAGIC_POWDER = 182,
	// 183 is empty
	CONST_ME_PIXIE_EXPLOSION = 184,
	CONST_ME_PIXIE_COMING = 185,
	CONST_ME_PIXIE_GOING = 186,
	// 187 is empty
	CONST_ME_STORM = 188,
	CONST_ME_STONE_STORM = 189,
	// 190 is empty
	CONST_ME_BLUE_GHOST = 191,
	// 192 is empty
	CONST_ME_PINK_VORTEX = 193,
	CONST_ME_TREASURE_MAP = 194,
	CONST_ME_PINK_BEAM = 195,
	CONST_ME_GREEN_FIREWORKS = 196,
	CONST_ME_ORANGE_FIREWORKS = 197,
	CONST_ME_PINK_FIREWORKS = 198,
	CONST_ME_BLUE_FIREWORKS = 199,
	
	// 200 is empty
	CONST_ME_THECUBE = 201,
	CONST_ME_DRAWINK = 202,
	CONST_ME_PRISMATICSPARKLES = 203,
	CONST_ME_THAIAN = 204,
	CONST_ME_THAIANGHOST = 205,
	CONST_ME_GHOSTSMOKE = 206,
	// 207 is empty
	CONST_ME_FLOATINGBLOCK = 208,
	CONST_ME_BLOCK = 209,
	CONST_ME_ROOTING = 210,
	// 211-212 were removed from the client
	CONST_ME_GHOSTLYSCRATCH = 213,
	CONST_ME_GHOSTLYBITE = 214,
	CONST_ME_BIGSCRATCHING = 215,
	CONST_ME_SLASH = 216,
	CONST_ME_BITE = 217,
	// 218 is empty
	CONST_ME_CHIVALRIOUSCHALLENGE = 219,
	CONST_ME_DIVINEDAZZLE = 220,
	CONST_ME_ELECTRICALSPARK = 221,
	CONST_ME_PURPLETELEPORT = 222,
	CONST_ME_REDTELEPORT = 223,
	CONST_ME_ORANGETELEPORT = 224,
	CONST_ME_GREYTELEPORT = 225,
	CONST_ME_LIGHTBLUETELEPORT = 226,
	// 227-229 are empty
	CONST_ME_FATAL = 230,
	CONST_ME_DODGE = 231,
	CONST_ME_HOURGLASS = 232,
	CONST_ME_FIREWORKSSTAR = 233,
	CONST_ME_FIREWORKSCIRCLE = 234,
	CONST_ME_FERUMBRAS_1 = 235,
	CONST_ME_GAZHARAGOTH = 236,
	CONST_ME_MAD_MAGE = 237,
	CONST_ME_HORESTIS = 238,
	CONST_ME_DEVOVORGA = 239,
	CONST_ME_FERUMBRAS_2 = 240,
	
	CONST_ME_LAST = CONST_ME_FERUMBRAS_2,
};

enum ShootType_t : uint8_t {
	CONST_ANI_NONE,

	CONST_ANI_SPEAR = 1,
	CONST_ANI_BOLT = 2,
	CONST_ANI_ARROW = 3,
	CONST_ANI_FIRE = 4,
	CONST_ANI_ENERGY = 5,
	CONST_ANI_POISONARROW = 6,
	CONST_ANI_BURSTARROW = 7,
	CONST_ANI_THROWINGSTAR = 8,
	CONST_ANI_THROWINGKNIFE = 9,
	CONST_ANI_SMALLSTONE = 10,
	CONST_ANI_DEATH = 11,
	CONST_ANI_LARGEROCK = 12,
	CONST_ANI_SNOWBALL = 13,
	CONST_ANI_POWERBOLT = 14,
	CONST_ANI_POISON = 15,
	CONST_ANI_INFERNALBOLT = 16,
	CONST_ANI_HUNTINGSPEAR = 17,
	CONST_ANI_ENCHANTEDSPEAR = 18,
	CONST_ANI_REDSTAR = 19,
	CONST_ANI_GREENSTAR = 20,
	CONST_ANI_ROYALSPEAR = 21,
	CONST_ANI_SNIPERARROW = 22,
	CONST_ANI_ONYXARROW = 23,
	CONST_ANI_PIERCINGBOLT = 24,
	CONST_ANI_WHIRLWINDSWORD = 25,
	CONST_ANI_WHIRLWINDAXE = 26,
	CONST_ANI_WHIRLWINDCLUB = 27,
	CONST_ANI_ETHEREALSPEAR = 28,
	CONST_ANI_ICE = 29,
	CONST_ANI_EARTH = 30,
	CONST_ANI_HOLY = 31,
	CONST_ANI_SUDDENDEATH = 32,
	CONST_ANI_FLASHARROW = 33,
	CONST_ANI_FLAMMINGARROW = 34,
	CONST_ANI_SHIVERARROW = 35,
	CONST_ANI_ENERGYBALL = 36,
	CONST_ANI_SMALLICE = 37,
	CONST_ANI_SMALLHOLY = 38,
	CONST_ANI_SMALLEARTH = 39,
	CONST_ANI_EARTHARROW = 40,
	CONST_ANI_EXPLOSION = 41,
	CONST_ANI_CAKE = 42,

    CONST_ANI_TARSALARROW = 44,
	CONST_ANI_VORTEXBOLT = 45,

	CONST_ANI_PRISMATICBOLT = 48,
	CONST_ANI_CRYSTALLINEARROW = 49,
	CONST_ANI_DRILLBOLT = 50,
	CONST_ANI_ENVENOMEDARROW = 51,

	CONST_ANI_GOLDENSTAR = 52,
	CONST_ANI_GLOOTHSPEAR = 53,
	CONST_ANI_SIMPLEARROW = 54,

    CONST_ANI_LEAFSTAR = 56,
	CONST_ANI_DIAMONDARROW = 57,
	CONST_ANI_SPECTRALBOLT = 58,
	CONST_ANI_ROYALSTAR = 59,
	CONST_ANI_BLUESTAR = 60,

	CONST_ANI_LAST = CONST_ANI_ROYALSTAR,

	// for internal use, don't send to client
	CONST_ANI_WEAPONTYPE = 0xFE, // 254
	
	CONST_ANI_MIX = 11,
	
};

enum SpeakClasses : uint8_t {
	TALKTYPE_SAY = 1,
	TALKTYPE_WHISPER = 2,
	TALKTYPE_YELL = 3,
	TALKTYPE_PRIVATE_PN = 4,
	TALKTYPE_PRIVATE_NP = 5,
	TALKTYPE_PRIVATE = 6,
	TALKTYPE_CHANNEL_Y = 7,
	TALKTYPE_CHANNEL_W = 8,
	TALKTYPE_RVR_CHANNEL = 9,
	TALKTYPE_RVR_ANSWER = 10,
	TALKTYPE_RVR_CONTINUE = 11,
	TALKTYPE_BROADCAST = 12,
	TALKTYPE_CHANNEL_R1 = 13, //red - #c text
	TALKTYPE_PRIVATE_RED = 14, //@name@text
	TALKTYPE_CHANNEL_O = 15, //@name@text
	TALKTYPE_CHANNEL_R2 = 17, //#d
	TALKTYPE_MONSTER_SAY = 19,
	TALKTYPE_MONSTER_YELL = 20,
};

enum MessageClasses : uint8_t {
	MESSAGE_STATUS_CONSOLE_RED = 18, /*Red message in the console*/
	MESSAGE_EVENT_ORANGE = 19, /*Orange message in the console*/
	MESSAGE_STATUS_CONSOLE_ORANGE = 20,  /*Orange message in the console*/
	MESSAGE_STATUS_WARNING = 21, /*Red message in game window and in the console*/
	MESSAGE_EVENT_ADVANCE = 22, /*White message in game window and in the console*/
	MESSAGE_EVENT_DEFAULT = 23, /*White message at the bottom of the game window and in the console*/
	MESSAGE_STATUS_DEFAULT = 24, /*White message at the bottom of the game window and in the console*/
	MESSAGE_INFO_DESCR = 25, /*Green message in game window and in the console*/
	MESSAGE_STATUS_SMALL = 26, /*White message at the bottom of the game window"*/
	MESSAGE_STATUS_CONSOLE_BLUE = 27, /*FIXME Blue message in the console*/
};

enum FluidColors_t : uint8_t {
	FLUID_EMPTY,
	FLUID_BLUE,
	FLUID_RED,
	FLUID_BROWN,
	FLUID_GREEN,
	FLUID_YELLOW,
	FLUID_WHITE,
	FLUID_PURPLE,
};

enum FluidTypes_t : uint8_t {
	FLUID_NONE = FLUID_EMPTY,
	FLUID_WATER = FLUID_BLUE,
	FLUID_BLOOD = FLUID_RED,
	FLUID_BEER = FLUID_BROWN,
	FLUID_SLIME = FLUID_GREEN,
	FLUID_LEMONADE = FLUID_YELLOW,
	FLUID_MILK = FLUID_WHITE,
	FLUID_MANA = FLUID_PURPLE,

	FLUID_LIFE = FLUID_RED + 8,
	FLUID_OIL = FLUID_BROWN + 8,
	FLUID_URINE = FLUID_YELLOW + 8,
	FLUID_COCONUTMILK = FLUID_WHITE + 8,
	FLUID_WINE = FLUID_PURPLE + 8,

	FLUID_MUD = FLUID_BROWN + 16,
	FLUID_FRUITJUICE = FLUID_YELLOW + 16,

	FLUID_LAVA = FLUID_RED + 24,
	FLUID_RUM = FLUID_BROWN + 24,
	FLUID_SWAMP = FLUID_GREEN + 24,

	FLUID_TEA = FLUID_BROWN + 32,

	FLUID_MEAD = FLUID_BROWN + 40,
};

const uint8_t reverseFluidMap[] = {
	FLUID_EMPTY,
	FLUID_WATER,
	FLUID_MANA,
	FLUID_BEER,
	FLUID_EMPTY,
	FLUID_BLOOD,
	FLUID_SLIME,
	FLUID_EMPTY,
	FLUID_LEMONADE,
	FLUID_MILK,
};

const uint8_t clientToServerFluidMap[] = {
	FLUID_EMPTY,
	FLUID_WATER,
	FLUID_MANA,
	FLUID_BEER,
	FLUID_MUD,
	FLUID_BLOOD,
	FLUID_SLIME,
	FLUID_RUM,
	FLUID_LEMONADE,
	FLUID_MILK,
	FLUID_WINE,
	FLUID_LIFE,
	FLUID_URINE,
	FLUID_OIL,
	FLUID_FRUITJUICE,
	FLUID_COCONUTMILK,
	FLUID_TEA,
	FLUID_MEAD,
};

enum ClientFluidTypes_t : uint8_t {
	CLIENTFLUID_EMPTY = 0,
	CLIENTFLUID_BLUE = 1,
	CLIENTFLUID_PURPLE = 2,
	CLIENTFLUID_BROWN_1 = 3,
	CLIENTFLUID_BROWN_2 = 4,
	CLIENTFLUID_RED = 5,
	CLIENTFLUID_GREEN = 6,
	CLIENTFLUID_BROWN = 7,
	CLIENTFLUID_YELLOW = 8,
	CLIENTFLUID_WHITE = 9,
};

const uint8_t fluidMap[] = {
	CLIENTFLUID_EMPTY,
	CLIENTFLUID_BLUE,
	CLIENTFLUID_RED,
	CLIENTFLUID_BROWN_1,
	CLIENTFLUID_GREEN,
	CLIENTFLUID_YELLOW,
	CLIENTFLUID_WHITE,
	CLIENTFLUID_PURPLE,
};

enum SquareColor_t : uint8_t {
	SQ_COLOR_BLACK = 0,
};

enum TextColor_t : uint8_t {
	TEXTCOLOR_BLUE = 5,
	TEXTCOLOR_LIGHTGREEN = 30,
	TEXTCOLOR_LIGHTBLUE = 35,
	TEXTCOLOR_MAYABLUE = 95,
	TEXTCOLOR_DARKRED = 108,
	TEXTCOLOR_LIGHTGREY = 129,
	TEXTCOLOR_SKYBLUE = 143,
	TEXTCOLOR_PURPLE = 155,
	TEXTCOLOR_RED = 180,
	TEXTCOLOR_ORANGE = 198,
	TEXTCOLOR_YELLOW = 210,
	TEXTCOLOR_WHITE_EXP = 215,
	TEXTCOLOR_NONE = 255,
};

enum Icons_t {
	ICON_POISON = 1 << 0,
	ICON_BURN = 1 << 1,
	ICON_ENERGY =  1 << 2,
	ICON_DRUNK = 1 << 3,
	ICON_MANASHIELD = 1 << 4,
	ICON_PARALYZE = 1 << 5,
	ICON_HASTE = 1 << 6,
	ICON_SWORDS = 1 << 7,
	ICON_DROWNING = 1 << 8,
	ICON_FREEZING = 1 << 9,
	ICON_DAZZLED = 1 << 10,
	ICON_CURSED = 1 << 11,
	ICON_PARTY_BUFF = 1 << 12,
	ICON_REDSWORDS = 1 << 13,
	ICON_PIGEON = 1 << 14,
};

enum WeaponType_t : uint8_t {
	WEAPON_NONE,
	WEAPON_SWORD,
	WEAPON_CLUB,
	WEAPON_AXE,
	WEAPON_SHIELD,
	WEAPON_DISTANCE,
	WEAPON_WAND,
	WEAPON_AMMO,
};

enum Ammo_t : uint8_t {
	AMMO_NONE,
	AMMO_BOLT,
	AMMO_ARROW,
	AMMO_SPEAR,
	AMMO_THROWINGSTAR,
	AMMO_THROWINGKNIFE,
	AMMO_STONE,
	AMMO_SNOWBALL,
};

enum WeaponAction_t : uint8_t {
	WEAPONACTION_NONE,
	WEAPONACTION_REMOVECOUNT,
	WEAPONACTION_REMOVECHARGE,
	WEAPONACTION_MOVE,
};

enum WieldInfo_t {
	WIELDINFO_LEVEL = 1 << 0,
	WIELDINFO_MAGLV = 1 << 1,
	WIELDINFO_VOCREQ = 1 << 2,
	WIELDINFO_PREMIUM = 1 << 3,
};

enum Skulls_t : uint8_t {
	SKULL_NONE = 0,
	SKULL_YELLOW = 1,
	SKULL_GREEN = 2,
	SKULL_WHITE = 3,
	SKULL_RED = 4,
	SKULL_BLACK = 5,
};

enum PartyShields_t : uint8_t {
	SHIELD_NONE = 0,
	SHIELD_WHITEYELLOW = 1,
	SHIELD_WHITEBLUE = 2,
	SHIELD_BLUE = 3,
	SHIELD_YELLOW = 4,
	SHIELD_BLUE_SHAREDEXP = 5,
	SHIELD_YELLOW_SHAREDEXP = 6,
	SHIELD_BLUE_NOSHAREDEXP_BLINK = 7,
	SHIELD_YELLOW_NOSHAREDEXP_BLINK = 8,
	SHIELD_BLUE_NOSHAREDEXP = 9,
	SHIELD_YELLOW_NOSHAREDEXP = 10,
};

enum GuildEmblems_t : uint8_t {
	GUILDEMBLEM_NONE = 0,
	GUILDEMBLEM_ALLY = 1,
	GUILDEMBLEM_ENEMY = 2,
	GUILDEMBLEM_NEUTRAL = 3
};

enum item_t : uint16_t {
	
	ITEM_BROWSEFIELD = 460,
	
	ITEM_DEPOT_NULL = 2594, // for internal use

	ITEM_DEPOT_I = 2594,
	ITEM_DEPOT_II = 2594,
	ITEM_DEPOT_III = 2594,
	ITEM_DEPOT_IV = 2594,
	ITEM_DEPOT_V = 2594,
	ITEM_DEPOT_VI = 2594,
	ITEM_DEPOT_VII = 2594,
	ITEM_DEPOT_VIII = 2594,
	ITEM_DEPOT_IX = 2594,
	ITEM_DEPOT_X = 2594,
	ITEM_DEPOT_XI = 2594,
	ITEM_DEPOT_XII = 2594,
	ITEM_DEPOT_XIII = 2594,
	ITEM_DEPOT_XIV = 2594,
	ITEM_DEPOT_XV = 2594,
	ITEM_DEPOT_XVI = 2594,
	ITEM_DEPOT_XVII = 2594,
	
	ITEM_FIREFIELD_PVP_FULL = 1487,
	ITEM_FIREFIELD_PVP_MEDIUM = 1488,
	ITEM_FIREFIELD_PVP_SMALL = 1489,
	ITEM_FIREFIELD_PERSISTENT_FULL = 1492,
	ITEM_FIREFIELD_PERSISTENT_MEDIUM = 1493,
	ITEM_FIREFIELD_PERSISTENT_SMALL = 1494,
	ITEM_FIREFIELD_NOPVP = 1500,

	ITEM_POISONFIELD_PVP = 1490,
	ITEM_POISONFIELD_PERSISTENT = 1496,
	ITEM_POISONFIELD_NOPVP = 1503,

	ITEM_ENERGYFIELD_PVP = 1491,
	ITEM_ENERGYFIELD_PERSISTENT = 1495,
	ITEM_ENERGYFIELD_NOPVP = 1504,

	ITEM_MAGICWALL = 1497,
	ITEM_MAGICWALL_PERSISTENT = 1498,
	ITEM_MAGICWALL_SAFE = 11098,

	ITEM_WILDGROWTH = 1499,
	ITEM_WILDGROWTH_PERSISTENT = 2721,
	ITEM_WILDGROWTH_SAFE = 11099,

	ITEM_BAG = 1987,

	ITEM_GOLD_COIN = 2148,
	ITEM_PLATINUM_COIN = 2152,
	ITEM_CRYSTAL_COIN = 2160,
	ITEM_BAR_COIN = 10559,

	ITEM_REWARD_CONTAINER = 21518, // expedition bag
	ITEM_REWARD_CHEST = 21584, // sturdy chest

	ITEM_DEPOT = 2594,
	ITEM_LOCKER1 = 2589,
	ITEM_INBOX = 2593,
	ITEM_MARKET = 14405,

	ITEM_MALE_CORPSE = 3058,
	ITEM_FEMALE_CORPSE = 3065,

	ITEM_FULLSPLASH = 2016,
	ITEM_SMALLSPLASH = 2019,

	ITEM_PARCEL = 2595,
	ITEM_LETTER = 2597,
	ITEM_LETTER_STAMPED = 2598,
	ITEM_LABEL = 2599,

	ITEM_AMULETOFLOSS = 2173,

	ITEM_DOCUMENT_RO = 1968, //read-only
};

enum PlayerFlags : uint64_t {
	PlayerFlag_CannotUseCombat = 1 << 0,
	PlayerFlag_CannotAttackPlayer = 1 << 1,
	PlayerFlag_CannotAttackMonster = 1 << 2,
	PlayerFlag_CannotBeAttacked = 1 << 3,
	PlayerFlag_CanConvinceAll = 1 << 4,
	PlayerFlag_CanSummonAll = 1 << 5,
	PlayerFlag_CanIllusionAll = 1 << 6,
	PlayerFlag_CanSenseInvisibility = 1 << 7,
	PlayerFlag_IgnoredByMonsters = 1 << 8,
	PlayerFlag_NotGainInFight = 1 << 9,
	PlayerFlag_HasInfiniteMana = 1 << 10,
	PlayerFlag_HasInfiniteSoul = 1 << 11,
	PlayerFlag_HasNoExhaustion = 1 << 12,
	PlayerFlag_CannotUseSpells = 1 << 13,
	PlayerFlag_CannotPickupItem = 1 << 14,
	PlayerFlag_CanAlwaysLogin = 1 << 15,
	PlayerFlag_CanBroadcast = 1 << 16,
	PlayerFlag_CanEditHouses = 1 << 17,
	PlayerFlag_CannotBeBanned = 1 << 18,
	PlayerFlag_CannotBePushed = 1 << 19,
	PlayerFlag_HasInfiniteCapacity = 1 << 20,
	PlayerFlag_CanPushAllCreatures = 1 << 21,
	PlayerFlag_CanTalkRedPrivate = 1 << 22,
	PlayerFlag_CanTalkRedChannel = 1 << 23,
	PlayerFlag_TalkOrangeHelpChannel = 1 << 24,
	PlayerFlag_NotGainExperience = 1 << 25,
	PlayerFlag_NotGainMana = 1 << 26,
	PlayerFlag_NotGainHealth = 1 << 27,
	PlayerFlag_NotGainSkill = 1 << 28,
	PlayerFlag_SetMaxSpeed = 1 << 29,
	PlayerFlag_SpecialVIP = 1 << 30,
	PlayerFlag_NotGenerateLoot = static_cast<uint64_t>(1) << 31,
	PlayerFlag_CanTalkRedChannelAnonymous = static_cast<uint64_t>(1) << 32,
	PlayerFlag_IgnoreProtectionZone = static_cast<uint64_t>(1) << 33,
	PlayerFlag_IgnoreSpellCheck = static_cast<uint64_t>(1) << 34,
	PlayerFlag_IgnoreWeaponCheck = static_cast<uint64_t>(1) << 35,
	PlayerFlag_CannotBeMuted = static_cast<uint64_t>(1) << 36,
	PlayerFlag_IsAlwaysPremium = static_cast<uint64_t>(1) << 37,
};

enum ReloadTypes_t : uint8_t  {
	RELOAD_TYPE_ALL,
	RELOAD_TYPE_ACTIONS,
	RELOAD_TYPE_AURAS,
	RELOAD_TYPE_CHAT,
	RELOAD_TYPE_CONFIG,
	RELOAD_TYPE_CREATURESCRIPTS,
	RELOAD_TYPE_EVENTS,
	RELOAD_TYPE_GLOBAL,
	RELOAD_TYPE_GLOBALEVENTS,
	RELOAD_TYPE_ITEMS,
	RELOAD_TYPE_MONSTERS,
	RELOAD_TYPE_MOUNTS,
	RELOAD_TYPE_MOVEMENTS,
	RELOAD_TYPE_NPCS,
	RELOAD_TYPE_QUESTS,
	RELOAD_TYPE_RAIDS,
	RELOAD_TYPE_SPELLS,
	RELOAD_TYPE_SHADERS,
	RELOAD_TYPE_TALKACTIONS,
	RELOAD_TYPE_WEAPONS,
	RELOAD_TYPE_WINGS,
	RELOAD_TYPE_SCRIPTS,
};

// OTCv8 features (from src/client/const.h)
enum class GameFeature_t : uint8_t {
	ProtocolChecksum = 1,
	AccountNames = 2,
	ChallengeOnLogin = 3,
	PenalityOnDeath = 4,
	NameOnNpcTrade = 5,
	DoubleFreeCapacity = 6,
	DoubleExperience = 7,
	TotalCapacity = 8,
	SkillsBase = 9,
	PlayerRegenerationTime = 10,
	ChannelPlayerList = 11,
	PlayerMounts = 12,
	EnvironmentEffect = 13,
	CreatureEmblems = 14,
	ItemAnimationPhase = 15,
	MagicEffectU16 = 16,
	PlayerMarket = 17,
	SpritesU32 = 18,
	TileAddThingWithStackpos = 19,
	OfflineTrainingTime = 20,
	PurseSlot = 21,
	FormatCreatureName = 22,
	SpellList = 23,
	ClientPing = 24,
	ExtendedClientPing = 25,
	DoubleHealth = 28,
	DoubleSkills = 29,
	ChangeMapAwareRange = 30,
	MapMovePosition = 31,
	AttackSeq = 32,
	BlueNpcNameColor = 33,
	DiagonalAnimatedText = 34,
	LoginPending = 35,
	NewSpeedLaw = 36,
	ForceFirstAutoWalkStep = 37,
	MinimapRemove = 38,
	DoubleShopSellAmount = 39,
	ContainerPagination = 40,
	ThingMarks = 41,
	LooktypeU16 = 42,
	PlayerStamina = 43,
	PlayerAddons = 44,
	MessageStatements = 45,
	MessageLevel = 46,
	NewFluids = 47,
	PlayerStateU16 = 48,
	NewOutfitProtocol = 49,
	PVPMode = 50,
	WritableDate = 51,
	AdditionalVipInfo = 52,
	BaseSkillU16 = 53,
	CreatureIcons = 54,
	HideNpcNames = 55,
	SpritesAlphaChannel = 56,
	PremiumExpiration = 57,
	BrowseField = 58,
	EnhancedAnimations = 59,
	OGLInformation = 60,
	MessageSizeCheck = 61,
	PreviewState = 62,
	LoginPacketEncryption = 63,
	ClientVersion = 64,
	ContentRevision = 65,
	ExperienceBonus = 66,
	Authenticator = 67,
	UnjustifiedPoints = 68,
	SessionKey = 69,
	DeathType = 70,
	IdleAnimations = 71,
	KeepUnawareTiles = 72,
	IngameStore = 73,
	IngameStoreHighlights = 74,
	IngameStoreServiceType = 75,
	AdditionalSkills = 76,
	DistanceEffectU16 = 77,
	Prey = 78,
	DoubleMagicLevel = 79,

	ExtendedOpcode = 80,
	MinimapLimitedToSingleFloor = 81,
	SendWorldName = 82,

	DoubleLevel = 83,
	DoubleSoul = 84,
	DoublePlayerGoodsMoney = 85,
	CreatureWalkthrough = 86,
	DoubleTradeMoney = 87,
	SequencedPackets = 88,
	Tibia12Protocol = 89,

	// 90-99 otclientv8 features
	NewWalking = 90,
	SlowerManualWalking = 91,

	ItemTooltip = 93,

	Bot = 95,
	BiggerMapCache = 96,
	ForceLight = 97,
	NoDebug = 98,
	BotProtection = 99,

	// Custom features for customer
	FasterAnimations = 101,
	CenteredOutfits = 102,
	SendIdentifiers = 103,
	WingsAndAura = 104,
	PlayerStateU32 = 105,
	OutfitShaders = 106,

	// advanced features
	PacketSizeU32 = 110,
	PacketCompression = 111,
	OldInformationBar = 112,
	HealthInfoBackground = 113,
	WingOffset = 114,
	AuraFrontAndBack = 115,

	MapDrawGroundFirst = 116,
	MapIgnoreCorpseCorrection = 117,
	DontCacheFiles = 118,
	BigAurasCenter = 119,
	NewUpdateWalk = 120,
	NewCreatureStacking = 121,
	CreaturesMana = 122,
	QuickLootFlags = 123,
	DontMergeAnimatedText = 124,
	MissionId = 125,
	ItemCustomAttributes = 126,
	AnimatedTextCustomFont = 127,

	LastGameFeature = 130
};

static constexpr int32_t CHANNEL_GUILD = 0x00;
static constexpr int32_t CHANNEL_PARTY = 0x01;
static constexpr int32_t CHANNEL_PRIVATE = 0xFFFF;
static constexpr int32_t CHANNEL_CAST = 0xFFFE;

//Reserved player storage key ranges;
//[10000000 - 20000000];
static constexpr int32_t PSTRG_RESERVED_RANGE_START = 10000000;
static constexpr int32_t PSTRG_RESERVED_RANGE_SIZE = 10000000;
//[1000 - 1500];
static constexpr int32_t PSTRG_OUTFITS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 1000);
static constexpr int32_t PSTRG_OUTFITS_RANGE_SIZE = 500;
//[2001 - 2011];
static constexpr int32_t PSTRG_MOUNTS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 2001);
static constexpr int32_t PSTRG_MOUNTS_RANGE_SIZE = 10;
static constexpr int32_t PSTRG_MOUNTS_CURRENTMOUNT = (PSTRG_MOUNTS_RANGE_START + 10);
//[2012 - 2022];
static constexpr int32_t PSTRG_WINGS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 2012);
static constexpr int32_t PSTRG_WINGS_RANGE_SIZE = 10;
static constexpr int32_t PSTRG_WINGS_CURRENTWINGS = (PSTRG_WINGS_RANGE_START + 10);
//[2023 - 2033];
static constexpr int32_t PSTRG_AURAS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 2023);
static constexpr int32_t PSTRG_AURAS_RANGE_SIZE = 10;
static constexpr int32_t PSTRG_AURAS_CURRENTAURA = (PSTRG_AURAS_RANGE_START + 10);
//[2034 - 2044];
static constexpr int32_t PSTRG_SHADERS_RANGE_START = (PSTRG_RESERVED_RANGE_START + 2034);
static constexpr int32_t PSTRG_SHADERS_RANGE_SIZE = 10;
static constexpr int32_t PSTRG_SHADERS_CURRENTSHADER = (PSTRG_SHADERS_RANGE_START + 10);


#define IS_IN_KEYRANGE(key, range) (key >= PSTRG_##range##_START && ((key - PSTRG_##range##_START) <= PSTRG_##range##_SIZE))

#endif
