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
-- 	Ethereal Soul Trader Modifications for AzerothCore
-- 	By StygianTheBest
--
-- 	This adds badges, tokens, and other items to the Ethereal Soul Trader pet. I give this item to new players 
-- 	so they can repair and sell on-the-go.
--
-- ############################################################################################################# --
*/


USE world;

-- ######################################################--
--	Ethereal Soul Trader
-- ######################################################--

-- Enable Repairs
UPDATE creature_template SET npcflag = 4225 WHERE entry = 27914;

/*
2412 - Ethereal Credit x 25
2411 - Ethereal Credit x 50
2408 - Ethereal Credit x 100
2409 - Ethereal Credit x 250
2407 - Ethereal Credit x 500
2410 - Ethereal Credit x 1000
*/

-- Clean Up
DELETE FROM npc_vendor -- Existing Items
WHERE entry = 27914 and item IN (38291, 38294, 38300, 38308, 17031, 3386, 13462);

DELETE FROM npc_vendor -- Currency Tokens
WHERE entry = 27914 and item IN (26044,26045,20558,20559,20560,29024,29434,40752,40753,41596,42425,43016,43228,43589,44990,45624,47241,47395,49426,47557,47558,47559,24579,24581,24245,28558,29736,29735);

-- Add Updated Items
INSERT INTO npc_vendor (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES 
(27914, 0, 38291, 0, 0, 0),
(27914, 0, 38294, 0, 0, 0),
(27914, 0, 38300, 0, 0, 0),
(27914, 0, 38308, 0, 0, 0),
(27914, 0, 17031, 0, 0, 0),
(27914, 0, 3386, 0, 0, 0),
(27914, 0, 13462, 0, 0, 0);

-- Add Additional Items & Currency Tokens
INSERT INTO npc_vendor (entry, item) VALUES 
('27914','26044'), -- Halaa Research Token
('27914','26045'), -- Halaa Battle Token
('27914','20558'),
('27914','20559'),
('27914','20560'),
('27914','29024'),
('27914','29434'),
('27914','40752'),
('27914','40753'),
('27914','41596'),
('27914','42425'),
('27914','43016'),
('27914','43228'),
('27914','43589'),
('27914','44990'),
('27914','45624'),
('27914','47241'),
('27914','47395'),
('27914','49426'),
('27914','47557'),
('27914','47558'),
('27914','47559'),
('27914','24579'), 
('27914','24581'), 
('27914','24245'), 
('27914','28558'), 
('27914','29736'), 
('27914','29735');

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
--	ETHEREAL SOUL TRADER PRICES
-- ######################################################--

UPDATE item_template SET buyprice=@75S WHERE entry = 38291; 	-- Etheral Mutagen
UPDATE item_template SET buyprice=@50S WHERE entry = 38294; 	-- Ethereal Liquour
UPDATE item_template SET buyprice=@25S WHERE entry = 38300; 	-- Diluted Etheraum Essence
UPDATE item_template SET buyprice=@50S WHERE entry = 38308; 	-- Ethereal Essence Sphere
UPDATE item_template SET sellprice=@10S WHERE entry = 38291; 	-- Etheral Mutagen
UPDATE item_template SET sellprice=@5S WHERE entry = 39294; 	-- Ethereal Liquour
UPDATE item_template SET sellprice=@1S WHERE entry = 38300; 	-- Diluted Etheraum Essence
UPDATE item_template SET sellprice=@5S WHERE entry = 38308; 	-- Ethereal Essence Sphere

-- ######################################################--
--  CURRENCY PRICES
-- ######################################################--

 -- HOLIDAY
UPDATE item_template SET sellprice=@3G, buyprice=@3G WHERE entry = 37829; 	    -- Brewfest Prize Token
 
 -- CRAFT
UPDATE item_template SET sellprice=@2G, buyprice=@2G WHERE entry = 24245; 	    -- Glowcap
UPDATE item_template SET sellprice=@2G, buyprice=@2G WHERE entry = 28558; 	    -- Spirit Shard 
UPDATE item_template SET sellprice=@2G, buyprice=@2G WHERE entry = 29736; 	    -- Arcane Rune  
UPDATE item_template SET sellprice=@2G, buyprice=@2G WHERE entry = 29735; 	    -- Holy Dust 
UPDATE item_template SET sellprice=@25G, buyprice=@25G WHERE entry = 41596; 	-- Dalaran Jewelcrafter's Token
UPDATE item_template SET sellprice=@25G, buyprice=@25G WHERE entry = 43016; 	-- Dalaran Cooking Award

-- BG/PVP
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 26044; 	    -- Halaa Research Token
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 26045; 	    -- Halaa Battle Token
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 20558; 	    -- Warsong Gulch Mark of Honor
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 20559; 	    -- Arathi Basin Mark of Honor
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 20560; 	    -- Alterac Valley Mark of Honor
UPDATE item_template SET sellprice=@1G, buyprice=@1G WHERE entry = 29024; 	    -- Eye of the Storm Mark of Honor
UPDATE item_template SET sellprice=@2G, buyprice=@2G WHERE entry = 24579; 	    -- Mark of Honor Hold
UPDATE item_template SET sellprice=@2G, buyprice=@2G WHERE entry = 24581; 	    -- Mark of Thrallmar
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 47395; 	    -- Isle of Conquest Mark of Honor
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 42425; 	    -- Strand of the Ancients Mark of Honor
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 43589; 	    -- Wintergrasp Mark of Honor

-- DUNGEON/RAID
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 43228; 	    -- Stone Keeper's Shard
UPDATE item_template SET sellprice=@5G, buyprice=@5G WHERE entry = 40752; 	    -- Emblem of Heroism (Heirloom)
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry = 29434;     -- Badge of Justice (Legacy)
UPDATE item_template SET sellprice=@10G, buyprice=@10G WHERE entry = 44990;     -- Champion's Seal (i200)
UPDATE item_template SET sellprice=@20G, buyprice=@20G WHERE entry = 40753;	    -- Emblem of Valor (i213)
UPDATE item_template SET sellprice=@20G, buyprice=@20G WHERE entry = 45624;     -- Emblem of Conquest(i213)
UPDATE item_template SET sellprice=@30G, buyprice=@30G WHERE entry = 47241;     -- Emblem of Triumph (i232)
UPDATE item_template SET sellprice=@40G, buyprice=@40G WHERE entry = 47557;     -- Grand Regalia of the Grand Protector (i258)
UPDATE item_template SET sellprice=@40G, buyprice=@40G WHERE entry = 47558;     -- Grand Regalia of the Grand Conquorer (i258)
UPDATE item_template SET sellprice=@40G, buyprice=@40G WHERE entry = 47559;     -- Grand Regalia of the Grand Vanquisher (i258)
UPDATE item_template SET sellprice=@50G, buyprice=@50G WHERE entry = 49426;     -- Emblem of Frost (i264)
