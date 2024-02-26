-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = true
protectionLevel = 1
killsToRedSkull = 15
pzLocked = 60000
removeChargesFromRunes = true
removeWeaponAmmunition = true
timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 15 * 60 * 1000
stairJumpExhaustion = 800
experienceByKillingPlayers = true
expFromPlayersLevelRange = 75
allowFightBack = "false"

accountManager = true
namelockManager = false
newPlayerChooseVoc = true
newPlayerSpawnPosX = 331
newPlayerSpawnPosY = 46
newPlayerSpawnPosZ = 6
newPlayerTownId = 1
newPlayerLevel = 1
newPlayerMagicLevel = 0
generateAccountNumber = false
generateAccountSalt = false

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "127.0.0.1"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 100
motd = "Welcome to Tibia2."
onePlayerOnlinePerAccount = true
allowClones = false
serverName = "Tibia2"
statusTimeout = 50000
replaceKickOnLogin = true
maxPacketsPerSecond = 100
enableLiveCasting = false
liveCastPort = 7173

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSQM = 1000
houseRentPeriod = "never"

-- Item Usage
timeBetweenActions = 150
timeBetweenExActions = 800

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "global"
mapAuthor = "Bruno"

-- MySQL
mysqlHost = "localhost"
mysqlUser = "root"
mysqlPass = ""
mysqlDatabase = "global3"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
-- NOTE: classicAttackSpeed set to true makes players constantly attack at regular
-- intervals regardless of other actions such as item (potion) use. This setting
-- may cause high CPU usage with many players and potentially affect performance!

allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = false
classicEquipmentSlots = true
classicAttackSpeed = true
autoStackItems = true
displayLootMessage = true

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
rateExp = 250
rateSkill = 30
rateLoot = 30
rateMagic = 8
rateSpawn = 1

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = false

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = false

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = true

-- Status server information
ownerName = ""
ownerEmail = ""
url = "https://otland.net/"
location = "Brazil"
