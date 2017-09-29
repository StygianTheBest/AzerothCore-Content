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
-- 	NPC Profession Trainer Template
-- 	By StygianTheBest
--
--	This is a template I use for creating Profession Trainer NPCs.
-- 
-- ############################################################################################################# --
*/


USE world;

-- ######################################################--
--	NPC PROFESSION TRAINER TEMPLATE - 60500
-- ######################################################--

SET
@Entry 			:= 60500,
@Model 			:= 18239, 					-- Epic Mage
@Name 			:= "Alchemy",
@Title 			:= "Grandmaster Trainer",
@Icon 			:= "Trainer",
@GossipMenu 	:= 0,
@MinLevel 		:= 80,
@MaxLevel 		:= 80,
@Faction 		:= 35,
@NPCFlag 		:= 81, 						-- Gossip + Profession Trainer (1+16+32)
@UnitFlags		:= 4608,
@UnitFlags2		:= 2048,
@Scale			:= 0.25,
@Rank			:= 1,						-- Elite
@Type 			:= 7,						-- Humanoid
@TypeFlags 		:= 0,
@TrainerType	:= 2,						-- Profession Trainer
@TrainerSpell	:= 0,
@TrainerClass 	:= 0,						
@TrainerRace 	:= 0,
@FlagsExtra 	:= 2,
@AIName			:= "",
@Script 		:= "",
@VerifiedBuild	:= "12340";

-- Alchemy
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, faction, npcflag, speed_walk, speed_run, scale, rank, unit_class, unit_flags, unit_flags2, type, type_flags, trainer_type, trainer_spell, trainer_class, trainer_race, InhabitType, RegenHealth, flags_extra, AiName, ScriptName, VerifiedBuild)
VALUES
(@Entry, @Model, @Name, @Title, @Icon, @GossipMenu, @MinLevel, @MaxLevel, @Faction, @NPCFlag, 1, 1.14286, @Scale, @Rank, 1, @UnitFlags, @UnitFlags2, @Type, @TypeFlags, @TrainerType, @TrainerSpell, @TrainerClass, @TrainerRace, 3, 1, @FlagsExtra, @AIName, @Script, @VerifiedBuild);

-- NPC EQUIP
DELETE FROM `creature_equip_template` WHERE `CreatureID`=@Entry AND `ID`=1;
INSERT INTO `creature_equip_template` VALUES (@Entry, 1, 2884, 0, 0, 18019); -- Dynamite Stick, None

-- END OF LINE
