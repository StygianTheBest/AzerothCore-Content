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
--	Fishing Price Mods
--	By StygianTheBest
--
--  This increases the sell price of rare fish and other fishing loot.
--
-- ############################################################################################################# --
*/


USE world;

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