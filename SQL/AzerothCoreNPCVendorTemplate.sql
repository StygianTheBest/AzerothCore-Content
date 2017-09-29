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
-- 	NPC Vendor Template
-- 	By StygianTheBest
--
--	This is a template I use for creating Vendor NPCs.
-- 
-- ############################################################################################################# --
*/


USE world;

-- ######################################################--
--	NPC VENDOR TEMPLATE - 604000
-- ######################################################--
SET
@Entry 		:= 604000,
@Model 		:= 7181, -- Goblin
@Name 		:= "Sparky Skyfire",
@Title 		:= "Fireworks",
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

-- NPC EQUIP
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 2884, 0, 0, 18019); -- Dynamite Stick, None

-- NPC VENDOR ITEMS
DELETE FROM npc_vendor WHERE entry = @Entry;
INSERT INTO npc_vendor (entry, item) VALUES 
(@Entry,41427),	-- Dalaran Firework
(@Entry,34599),	-- Juggling Torch
(@Entry,23771),	-- Green Smoke Flare
(@Entry,23768),	-- White Smoke Flare
(@Entry,21747),	-- Festival Firecracker
(@Entry,21745),	-- Elder's Moonstone
(@Entry,21744),	-- Lucky Rocket Cluster
(@Entry,21713),	-- Elune's Candle
(@Entry,34850),	-- Midsummer Ground Flower
(@Entry,21576),	-- Red Rocket Cluster
(@Entry,21574),	-- Green Rocket Cluster
(@Entry,21571),	-- Blue Rocket Cluster
(@Entry,21570),	-- Cluster Launcher
(@Entry,19026),	-- Snake Burst Firework
(@Entry, 9318),	-- Red Firework	
(@Entry, 9315),	-- Yellow Rose Firework	
(@Entry, 9314),	-- Red Streaks Firework	
(@Entry, 9313),	-- Green Firework	
(@Entry, 9312),	-- Blue Firework	
(@Entry, 8626);	-- Blue Sparkler	

-- END OF LINE