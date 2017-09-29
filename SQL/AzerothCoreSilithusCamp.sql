/*
-- ############################################################################################################# --
-- 
--  ____    __                                         ______  __              ____                    __      
-- /\  _`\ /\ \__                  __                 /\__  _\/\ \            /\  _`\                 /\ \__   
-- \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\/_/\ \/\ \ \___      __\ \ \L\ \     __    ____\ \ ,_\  
--  \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \ \ \ \  _ `\  /'__`\ \  _ <'  /'__`\ /',__\\ \ \/  
--    /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \ \ \ \ \ \ \/\  __/\ \ \L\ \/\  __//\__, `\\ \ \_ 
--    \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \ \_\ \ \_\ \_\ \____\\ \____/\ \____\/\____/ \ \__\
--     \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/  \/_/  \/_/\/_/\/____/ \/___/  \/____/\/___/   \/__/
--                     /\___/ /\____/                                                                         
--                     \/__/  \_/__/               http://stygianthebest.github.io                                                    
--
-- ############################################################################################################# --
--
--	Silithus Camp for AzerothCore
--  By StygianTheBest
--
-- 	This script populates the abandoned Tauren encampment off the southern coast of Silithus. This area is a 
--	work in progress and is used as a basecamp for players on my server as well as testing new code. I plan to
-- 	continue populating the area as I learn new things. 
--
-- ############################################################################################################# --
*/


-- ######################################################--
--	FISHING VENDOR - 601005
-- ######################################################--
SET
@Entry 		:= 601005,
@Model 		:= 3285, -- Fishing Trainer
@Name 		:= "John the Fisherman",
@Title 		:= "Pro Angler",
@Icon 		:= "Buy",
@GossipMenu := 0,
@MinLevel 	:= 80,
@MaxLevel 	:= 80,
@Faction 	:= 35,
@NPCFlag 	:= 128, -- Vendor
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 7,
@TypeFlags 	:= 0,
@FlagsExtra := 2,
@AIName		:= "SmartAI",
@Script 	:= "";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- NPC EQUIPPED
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 45991, 34484, 0, 18019); -- Fishing Pole, Old Ironjaw

-- NPC ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item) VALUES 
-- BOOKS
(@Entry,27532),	-- Book: Master Fishing
(@Entry,16082),	-- Book: Artisan Fishing 
(@Entry,16083),	-- Book: Expert Fishing 
-- ENCHANTS
(@Entry,50816),	-- Scroll Enchant Gloves: Angler 
(@Entry,50406),	-- Formula Enchant Gloves: Angler
(@Entry,38802),	-- Enchant Gloves Fishing
-- POTIONS
(@Entry,6372), 	-- Swim Speed Potion
(@Entry,5996), 	-- Elixer of Water Breathing
(@Entry,18294), -- Elixer of Greater Water Breathing
(@Entry,8827), 	-- Elixer of Water Walking
-- SPECIAL
(@Entry,19979),	-- Hook of the Master Angler 
(@Entry,33223),	-- Fishing Chair
-- VANITY
(@Entry,1827),	-- Meat Cleaver
(@Entry,2763), 	-- Fisherman's Knife
-- CLOTHING
(@Entry,7996),	-- Worn Fishing Hat 
(@Entry,19972),	-- Lucky Fishing Hat
(@Entry,3563), 	-- Seafarer's Pantaloons
(@Entry,7052), 	-- Azure Silk Belt
(@Entry, 50287),-- Boots of the Bay
(@Entry,19969),	-- Nat Pagle's Extreme Anglin' Boots 
(@Entry,6263), 	-- Blue Overalls
(@Entry,3342), 	-- Captain Sander's Shirt
(@Entry,4509), 	-- Seawolf Gloves
(@Entry,792), 	-- Knitted Sandals
(@Entry,33820),	-- Weather Beaten Fishing Hat 
(@Entry, 7348), -- Fletcher's Gloves
(@Entry, 36019), -- Aerie Belt of Nature Protection
-- POLES
(@Entry,19970),	-- Arcanite Fishing Pole 
(@Entry,44050),	-- Mastercraft Kaluak Fishing Pole 
(@Entry,45992),	-- Jeweled Fishing Pole 
(@Entry,25978),	-- Seth's Graphite Fishing Pole 
(@Entry,19022),	-- Nat Pagle's Extreme Angler FC-5000
(@Entry,45991),	-- Bone Fishing Pole 
(@Entry,45858),	-- Nat's Lucky Fishing Pole 
(@Entry,12225),	-- Blump Family Fishing Pole
(@Entry,6367),	-- Big Iron Fishing Pole
(@Entry,6365),	-- Strong Fishing Pole
(@Entry,6366),	-- Darkwood Fishing Pole
(@Entry,6256),	-- Fishing Pole 
-- LINE
(@Entry,34836),	-- Trusilver Spun Fishing Line 
(@Entry,19971),	-- High Test Eternium Fishing Line 
-- LURES
(@Entry,34861), -- Sharpened Fishing Hook
(@Entry,46006), -- Glow Worm
(@Entry,6811), 	-- Aquadynamic Fish Lens
(@Entry,7307), 	-- Flesh Eating Worm
(@Entry,6533), 	-- Aquadynamic Fish Attractor
(@Entry,6532), 	-- Bright Baubles
(@Entry,6530), 	-- Nightcrawlers
(@Entry,6529), 	-- Shiny Bauble
-- ANGLIN'
(@Entry,34832), -- Captain Rumsey's Lager
(@Entry,18229);	-- Nat Pagle's Guide to Extreme Anglin' 

-- Fisherman (Silithus Camp)
DELETE FROM `creature` WHERE `guid`=1994210; -- Silithus Camp (ANIMATED)
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (1994210, 601005, 1, 1, 1, 0, 1, -10749.5, 2517.59, 1.57246, 1.84172, 300, 0, 0, 5342, 0, 2, 0, 0, 0);
DELETE FROM `gameobject` WHERE `guid`=500467; -- FISHING CHAIR
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500467, 186475, 1, 1, 1, -10749.2, 2516.27, 2.26279, 1.81423, -0, -0, -0.787729, -0.616021, 300, 0, 1, 0);
DELETE FROM `gameobject` WHERE `guid`=500469; -- OILY BLACKMOUTH SCHOOL
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500469, 180682, 1, 1, 1, -10750.8, 2527.94, 0.00143518, 3.84841, -0, -0, -0.938199, 0.346096, 300, 0, 1, 0);

-- CLEAN UP FISHERMAN WAYPOINTS
DELETE FROM `creature_addon` WHERE `guid`=1994210;
DELETE FROM `db_script_string` WHERE entry >= 2000006050 AND entry <= 2000006052;
DELETE FROM `waypoint_scripts` WHERE guid >= 938 AND guid <= 941;
DELETE FROM `creature` WHERE guid >= 1995303 AND guid <= 1995315;
DELETE FROM `waypoint_data` WHERE id = 1994210 AND point <= 13;

-- FISHERMAN CREATURE ADDON
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (1994210, 1994210, 0, 0, 0, 0, NULL);

-- FISHERMAN WAYPOINT STRINGS
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) 
VALUES 
(2000006050, 'Ahh.. the sea. Once it casts its spell, it holds one in its net of wonder forever.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000006051, 'Many men go fishing all of their lives without knowing that it is not fish they are after.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000006052, 'I wonder if they ever found that hidden treasure buried on the Isle of Dread?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- FISHERMAN WAYPOINT SCRIPTS
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) 
VALUES 
(938, 0, 0, 0, 0, 2000006050, 0, 0, 0, 0, 938), -- Say
(939, 0, 0, 0, 0, 2000006051, 0, 0, 0, 0, 939), -- Say
(940, 0, 0, 0, 0, 2000006052, 0, 0, 0, 0, 940), -- Say
(941, 0, 31, 601005, 0, 0, 0, 0, 0, 0, 941);	-- Equip

-- FISHERMAN WAYPOINT GUID
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
VALUES 
(1995315, 1, 1, 1, 1, 0, 0, -10749, 2517.63, 1.60554, 1.43331, 300, 0, 0, 41, 0, 0, 0, 33554432, 0),
(1995314, 1, 1, 1, 1, 0, 0, -10700.2, 2523.61, 0.792882, 1.43331, 300, 0, 0, 41, 0, 0, 0, 33554432, 0),
(1995313, 1, 1, 1, 1, 0, 0, -10702.7, 2521.03, 2.26718, 1.43331, 300, 0, 0, 2, 0, 0, 0, 33554432, 0),
(1995312, 1, 1, 1, 1, 0, 0, -10732.6, 2518.96, 1.79036, 1.43331, 300, 0, 0, 24, 0, 0, 0, 33554432, 0),
(1995311, 1, 1, 1, 1, 0, 0, -10745.8, 2511.96, 3.60894, 1.43331, 300, 0, 0, 42, 0, 0, 0, 33554432, 0),
(1995310, 1, 1, 1, 1, 0, 0, -10760.3, 2513.04, 1.92615, 1.43331, 300, 0, 0, 5, 0, 0, 0, 33554432, 0),
(1995309, 1, 1, 1, 1, 0, 0, -10791.1, 2489.84, 1.98191, 1.43331, 300, 0, 0, 10, 0, 0, 0, 33554432, 0),
(1995308, 1, 1, 1, 1, 0, 0, -10807.8, 2461.83, 1.04805, 1.43331, 300, 0, 0, 6, 0, 0, 0, 33554432, 0),
(1995307, 1, 1, 1, 1, 0, 0, -10805.9, 2460.9, 2.03948, 1.43331, 300, 0, 0, 20, 0, 0, 0, 33554432, 0),
(1995306, 1, 1, 1, 1, 0, 0, -10791.4, 2490.54, 1.74961, 1.43331, 300, 0, 0, 15, 0, 0, 0, 33554432, 0),
(1995305, 1, 1, 1, 1, 0, 0, -10777.2, 2504.67, 0.528472, 1.43331, 300, 0, 0, 38, 0, 0, 0, 33554432, 0),
(1995304, 1, 1, 1, 1, 0, 0, -10776.3, 2503.56, 1.20431, 1.43331, 300, 0, 0, 4, 0, 0, 0, 33554432, 0),
(1995303, 1, 1, 1, 1, 0, 0, -10749.4, 2519.6, 0.203893, 1.43331, 300, 0, 0, 50, 0, 0, 0, 33554432, 0);

-- FISHERMAN WAYPOINT DATA
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) 
VALUES 
-- Start
(1994210, 1, -10749.4, 2519.6, 0.203893, 0, 30000, 0, 939, 33, 1995303),
(1994210, 2, -10776.3, 2503.56, 1.20431, 0, 0, 0, 0, 100, 1995304),
(1994210, 3, -10777.2, 2504.67, 0.528472, 0, 30000, 0, 0, 100, 1995305),
-- Headed to boats
(1994210, 4, -10791.4, 2490.54, 1.74961, 0, 0, 0, 940, 10, 1995306),
(1994210, 5, -10805.9, 2460.9, 2.03948, 0, 0, 0, 0, 100, 1995307),
-- At the boats, TODO: equip fishing pole (EVENT 941)
(1994210, 6, -10807.8, 2461.83, 1.04805, 0, 60000, 0, 941, 100, 1995308),
(1994210, 7, -10791.1, 2489.84, 1.98191, 0, 0, 0, 0, 100, 1995309),
(1994210, 8, -10760.3, 2513.04, 1.92615, 0, 0, 0, 0, 100, 1995310),
(1994210, 9, -10745.8, 2511.96, 3.60894, 0, 0, 0, 0, 100, 1995311),
(1994210, 10, -10732.6, 2518.96, 1.79036, 0, 0, 0, 0, 100, 1995312),
(1994210, 11, -10702.7, 2521.03, 2.26718, 0, 0, 0, 0, 100, 1995313),
-- Looking at sunset
(1994210, 12, -10700.2, 2523.61, 0.792882, 0, 60000, 0, 938, 33, 1995314),
(1994210, 13, -10749, 2517.63, 1.60554, 0, 0, 0, 0, 25, 1995315);


-- ######################################################--
--	WANDERING COW - 601030
-- ######################################################--
SET
@Entry 		:= 601030,
@Model 		:= 1060, -- Cow
@Name 		:= "Cowlie",
@Title 		:= "The Milker",
@Icon 		:= NULL,
@GossipMenu := 0,
@MinLevel 	:= 1,
@MaxLevel 	:= 1,
@Faction 	:= 190,
@NPCFlag 	:= 0,
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 8,	-- Critter
@TypeFlags 	:= 0,
@FlagsExtra := 0,
@AIName		:= "SmartAI",
@Script 	:= "";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- Cowlie the Milker (Silithus Camp)
DELETE FROM `creature` WHERE `guid`=601030;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (601030, 601030, 1, 1, 1, 0, 0, -10740.6, 2430.06, 6.73322, 6.2533, 300, 25, 0, 42, 0, 1, 0, 0, 0);


-- ######################################################--
--	WANDERING PIG - 601031
-- ######################################################--
SET
@Entry 		:= 601031,
@Model 		:= 16257, -- Pig
@Name 		:= "Cutie Pig",
@Title 		:= "For Amy",
@Icon 		:= NULL,
@GossipMenu := 0,
@MinLevel 	:= 1,
@MaxLevel 	:= 1,
@Faction 	:= 190,
@NPCFlag 	:= 0,
@Scale		:= 1.0,
@Rank		:= 0,
@Type 		:= 8,	-- Critter
@TypeFlags 	:= 0,
@FlagsExtra := 0,
@AIName		:= "SmartAI",
@Script 	:= "";

-- NPC
DELETE FROM creature_template WHERE entry = @Entry;
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, AiName, ScriptName) VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, 2, @Type, @TypeFlags, 3, 1, @FlagsExtra, @AIName, @Script);

-- Cutie Pig (Silithus Camp)
DELETE FROM `creature` WHERE `guid`=601031;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (601031, 601031, 1, 1, 1, 0, 0, -10740.6, 2430.06, 6.73322, 6.2533, 300, 25, 0, 42, 0, 1, 0, 0, 0);


-- ######################################################--
--	OBJECTS
-- ######################################################--

-- Forge In Tent (Silithus Camp)
DELETE FROM `gameobject` WHERE `guid`=500694; -- FORGE IN TENT
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500694, 192572, 1, 1, 1, -10710.3, 2411.39, 7.60782, 5.82762, -0, -0, -0.22582, 0.974169, 300, 0, 1, 0);

-- Anvil In Tent (Silithus Camp)
DELETE FROM `gameobject` WHERE `guid`=500927;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500927, 192019, 1, 1, 1, -10712.2, 2412.71, 7.60568, 5.69013, -0, -0, -0.2922, 0.956357, 300, 0, 1, 0);

-- Mailbox (Silithus Camp)
DELETE FROM `gameobject` WHERE `guid`=500802;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES (500802, 195629, 1, 1, 1, -10725, 2471.15, 7.58998, 0.506509, -0, -0, -0.250556, -0.968102, 300, 0, 1, 0);


-- ######################################################--
--	CURRENCY CONVERSION
-- ######################################################--
SET @1C :=1;				--	   1 Copper
SET @1S :=100;				--	   1 Silver
SET @5S :=500;				--	   5 Silver
SET @10S :=1000;			--	   10 Silver
SET @25S :=2500;			--	   25 Silver
SET @50S :=5000;			--	   50 Silver
SET @75S :=7500;			--	   75 Silver
SET @1G :=10000; 			--     1 Gold
SET @2G :=20000; 			--     2 Gold
SET @3G :=30000; 			--     3 Gold
SET @4G :=40000; 			--     4 Gold
SET @5G :=50000; 			--     5 Gold
SET @10G :=100000; 			--    10 Gold
SET @15G :=150000; 			--    15 Gold
SET @18G :=180000; 			--    18 Gold
SET @20G :=200000; 			--    20 Gold
SET @25G :=250000; 			--    25 Gold
SET @30G :=300000; 			--    30 Gold
SET @40G :=400000; 			--    40 Gold
SET @50G :=500000; 			--    50 Gold
SET @75G :=750000; 			--    75 Gold
SET @100G :=1000000; 		--   100 Gold
SET @250G :=2500000; 		--   250 Gold
SET @300G :=3000000; 		--   300 Gold
SET @350G :=3500000; 		--   350 Gold
SET @375G :=3750000; 		--   375 Gold
SET @500G :=5000000; 		--   500 Gold
SET @750G :=7500000; 		--   750 Gold
SET @1000G :=10000000; 		--  1000 Gold
SET @1500G :=15000000; 		--  1500 Gold
SET @2500G :=25000000; 		--  2500 Gold
SET @5000G :=50000000; 		--  5000 Gold
SET @7500G :=75000000; 		--  7500 Gold
SET @10000G :=100000000; 	-- 10000 Gold
SET @12500G :=125000000; 	-- 12500 Gold
SET @15000G :=150000000; 	-- 15000 Gold
SET @20000G :=200000000; 	-- 20000 Gold
SET @25000G :=250000000; 	-- 20000 Gold
SET @50000G :=500000000; 	-- 50000 Gold
SET @75000G :=750000000; 	-- 75000 Gold

-- ######################################################--
--	FISHING VENDOR
-- ######################################################--

-- BOOKS
UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 27532;			-- Book: Master Fishing
UPDATE item_template SET sellprice=@25G, buyprice=@25G WHERE entry = 16082;			-- Book: Artisan Fishing 
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry = 16083;			-- Book: Expert Fishing 

-- ENCHANTS
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 50816;			-- Scroll Enchant Gloves: Angler 
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 50406;		-- Formula Enchant Gloves: Angler
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 38802;			-- Enchant Gloves Fishing

-- POTIONS
UPDATE item_template SET sellprice=@50S, buyprice=@50S WHERE entry = 6372; 			-- Swim Speed Potion
UPDATE item_template SET sellprice=@25S, buyprice=@25S WHERE entry = 5996; 			-- Elixer of Water Breathing
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 18294; 			-- Elixer of Greater Water Breathing
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 8827; 			-- Elixer of Water Walking

-- SPECIAL
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 19979;		-- Hook of the Master Angler 
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 33223;		-- Fishing Chair

-- VANITY
-- UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 1827;		- Meat Cleaver
-- UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 2763; 		-- Fisherman's Knife

-- CLOTHING
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry = 7996;			-- Worn Fishing Hat 
UPDATE item_template SET sellprice=@25G, buyprice=@25G WHERE entry = 19972;			-- Lucky Fishing Hat
-- UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 3563; 		-- Seafarer's Pantaloons
UPDATE item_template SET sellprice=@25G, buyprice=@25G WHERE entry = 7052; 			-- Azure Silk Belt
UPDATE item_template SET sellprice=@250G, buyprice=@250G WHERE entry =  50287;		-- Boots of the Bay
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 19969;		-- Nat Pagle's Extreme Anglin' Boots 
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry = 6263; 			-- Blue Overalls
-- UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 3342; 		-- Captain Sander's Shirt
-- UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 4509; 		-- Seawolf Gloves
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 792; 			-- Knitted Sandals
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 33820;		-- Weather Beaten Fishing Hat 
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry =  7348; 		-- Fletcher's Gloves
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry =  36019; 			-- Aerie Belt of Nature Protection

-- POLES
UPDATE item_template SET sellprice=@15000G, buyprice=@15000G WHERE entry = 19970;	-- Arcanite Fishing Pole 
UPDATE item_template SET sellprice=@15000G, buyprice=@15000G WHERE entry = 44050;	-- Mastercraft Kaluak Fishing Pole 
UPDATE item_template SET sellprice=@5000G, buyprice=@5000G WHERE entry = 45992;		-- Jeweled Fishing Pole 
UPDATE item_template SET sellprice=@1000G, buyprice=@1000G WHERE entry = 25978;		-- Seth's Graphite Fishing Pole 
UPDATE item_template SET sellprice=@500G, buyprice=@500G WHERE entry = 19022;		-- Nat Pagle's Extreme Angler FC-5000
UPDATE item_template SET sellprice=@2500G, buyprice=@2500G WHERE entry = 45991;		-- Bone Fishing Pole 
UPDATE item_template SET sellprice=@50G, buyprice=@1500G WHERE entry = 45858;		-- Nat's Lucky Fishing Pole 
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 12225;			-- Blump Family Fishing Pole
UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 6367;			-- Big Iron Fishing Pole
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 6365;			-- Strong Fishing Pole
UPDATE item_template SET sellprice=@50G, buyprice=@100G WHERE entry = 6366;			-- Darkwood Fishing Pole
UPDATE item_template SET sellprice=@50G, buyprice=@25S WHERE entry = 6256;			-- Fishing Pole 
-- UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 45120;		-- Basic Fishing Pole

-- FISHING LINE
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 34836;			-- Trusilver Spun Fishing Line 
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry = 19971;			-- High Test Eternium Fishing Line 
	
-- LURES	
UPDATE item_template SET sellprice=@3G, buyprice=@3G WHERE entry = 7307; 			-- Flesh Eating Worm
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 46006; 			-- Glow Worm
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 34861; 			-- Sharpened Fishing Hook
UPDATE item_template SET sellprice=@75S, buyprice=@75S WHERE entry = 6811; 			-- Aquadynamic Fish Lens
UPDATE item_template SET sellprice=@25S, buyprice=@25S WHERE entry = 6533; 			-- Aquadynamic Fish Attractor
UPDATE item_template SET sellprice=@5S, buyprice=@5S WHERE entry = 6532; 			-- Bright Baubles
UPDATE item_template SET sellprice=@1S, buyprice=@1S WHERE entry = 6530; 			-- Nightcrawlers
UPDATE item_template SET sellprice=@1S, buyprice=@1S WHERE entry = 6529; 			-- Shiny Bauble
	
-- ANGLIN'	
UPDATE item_template SET sellprice=@50S, buyprice=@50S WHERE entry = 34832; 		-- Captain Rumsey's Lager
UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 18229;			-- Nat Pagle's Guide to Extreme Anglin' 


-- ######################################################--
--	FISH
-- ######################################################--

-- Items
UPDATE item_template SET sellprice=@100G WHERE entry = 27442; 	-- Goldenscale Vendorfish
UPDATE item_template SET sellprice=@500G WHERE entry = 6360; 	-- Steelscale Crushfish
UPDATE item_template SET sellprice=@500G WHERE entry = 19808; 	-- Rockhide Strongfish
UPDATE item_template SET sellprice=@500G WHERE entry = 44703; 	-- Dark Herring
UPDATE item_template SET sellprice=@750G WHERE entry = 44505; 	-- Dustbringer
UPDATE item_template SET sellprice=@750G WHERE entry = 6651; 	-- Broken Wine Bottle
UPDATE item_template SET sellprice=@1000G WHERE entry = 34486; 	-- Old Crafty
UPDATE item_template SET sellprice=@1000G WHERE entry = 34484; 	-- Old Ironjaw

-- Mud Snapper
UPDATE item_template SET sellprice=@25G WHERE entry = 6292; 	-- 10 Mud Snapper
UPDATE item_template SET sellprice=@50G WHERE entry = 6294; 	-- 12 Mud Snapper
UPDATE item_template SET sellprice=@75G WHERE entry = 6295; 	-- 15 Mud Snapper

-- Catfish
UPDATE item_template SET sellprice=@10G WHERE entry = 6309; 	-- 17 Catfish
UPDATE item_template SET sellprice=@25G WHERE entry = 6310; 	-- 19 Catfish
UPDATE item_template SET sellprice=@50G WHERE entry = 6311; 	-- 22 Catfish
UPDATE item_template SET sellprice=@75G WHERE entry = 6363; 	-- 26 Catfish
UPDATE item_template SET sellprice=@100G WHERE entry = 6364; 	-- 32 Catfish

-- Grouper
UPDATE item_template SET sellprice=@10G WHERE entry = 13876; 	-- 40 Grouper
UPDATE item_template SET sellprice=@25G WHERE entry = 13877; 	-- 47 Grouper
UPDATE item_template SET sellprice=@50G WHERE entry = 13878; 	-- 53 Grouper
UPDATE item_template SET sellprice=@75G WHERE entry = 13879; 	-- 59 Grouper
UPDATE item_template SET sellprice=@100G WHERE entry = 13880; 	-- 68 Grouper

-- Redgill
UPDATE item_template SET sellprice=@10G WHERE entry = 13885; 	-- 34 Redgill
UPDATE item_template SET sellprice=@15G WHERE entry = 13886; 	-- 37 Redgill
UPDATE item_template SET sellprice=@25G WHERE entry = 13882; 	-- 42 Redgill
UPDATE item_template SET sellprice=@50G WHERE entry = 13883; 	-- 45 Redgill
UPDATE item_template SET sellprice=@75G WHERE entry = 13884; 	-- 49 Redgill
UPDATE item_template SET sellprice=@100G WHERE entry = 13887; 	-- 52 Redgill

-- Salmon
UPDATE item_template SET sellprice=@5G WHERE entry = 13901; 	-- 15 Salmon
UPDATE item_template SET sellprice=@10G WHERE entry = 13902; 	-- 18 Salmon
UPDATE item_template SET sellprice=@25G WHERE entry = 13903; 	-- 22 Salmon
UPDATE item_template SET sellprice=@50G WHERE entry = 13904; 	-- 25 Salmon
UPDATE item_template SET sellprice=@75G WHERE entry = 13905; 	-- 29 Salmon
UPDATE item_template SET sellprice=@100G WHERE entry = 13906; 	-- 32 Salmon

-- Lobster
UPDATE item_template SET sellprice=@1G WHERE entry = 13907; 	--  7 Lobster
UPDATE item_template SET sellprice=@5G WHERE entry = 13908; 	--  9 Lobster
UPDATE item_template SET sellprice=@10G WHERE entry = 13909; 	-- 12 Lobster
UPDATE item_template SET sellprice=@25G WHERE entry = 13910; 	-- 15 Lobster
UPDATE item_template SET sellprice=@50G WHERE entry = 13911; 	-- 19 Lobster
UPDATE item_template SET sellprice=@75G WHERE entry = 13912; 	-- 21 Lobster
UPDATE item_template SET sellprice=@100G WHERE entry = 13913; 	-- 22 Lobster

-- Mightfish
UPDATE item_template SET sellprice=@25G WHERE entry = 13914; 	--  70 Mightfish
UPDATE item_template SET sellprice=@50G WHERE entry = 13915; 	--  85 Mightfish
UPDATE item_template SET sellprice=@75G WHERE entry = 13916; 	--  92 Mightfish
UPDATE item_template SET sellprice=@100G WHERE entry = 13917; 	-- 103 Mightfish


-- ######################################################--
--	FISHING RARES
-- ######################################################--

-- 25
UPDATE item_template SET sellprice=@25G, buyprice=@25G WHERE entry = 6297; 		-- Old Skull (Can be fished in the lava pool where Ragnaros spawns)

-- 75
UPDATE item_template SET sellprice=@75G, buyprice=@75G WHERE entry = 18365; 	-- A Thoroughly Read Copy of Nat's Anglin'

-- 100
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 18335; 	-- Pristine Black Diamond
UPDATE item_template SET sellprice=@100G, buyprice=@100G WHERE entry = 34826; 	-- Gold Wedding Band

-- 250
UPDATE item_template SET sellprice=@250G, buyprice=@250G WHERE entry = 45994; 	-- Lost Ring 
UPDATE item_template SET sellprice=@250G, buyprice=@250G WHERE entry = 45995; 	-- Lost Necklace 

-- 750
UPDATE item_template SET sellprice=@750G, buyprice=@750G WHERE entry = 8350;	-- The 1 Ring
UPDATE item_template SET sellprice=@750G, buyprice=@750G WHERE entry = 34837; 	-- The 2 Ring 
UPDATE item_template SET sellprice=@750G, buyprice=@750G WHERE entry = 45859; 	-- The 5 Ring

-- END OF LINE