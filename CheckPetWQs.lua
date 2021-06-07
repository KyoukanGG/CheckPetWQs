local addon_name, addon = ...

LibStub("AceAddon-3.0"):NewAddon(addon, addon_name)

local colReset = "|r"
local colGrey = "|cff999999"
local colWhite = "|cffffffff"
local colPink = "|cffFF69B4" --General/Family Familiar
local colGreen = "|cff1eff00" --Legion
local colPurple = "|cffb048f8" --Legion: Argus
local colYellow = "|cfffac808" --BfA: 8.2 Nazjatar and Mechagon
local colBlue = "|cff0080ff" --BfA: 8.1 Kul Tiras
--Alt blue: cff0000ff
--Alt blue: cff00ccff
local colRed = "|cffff0000" --BfA: 8.1 Zandalar
--Alt red: cffff6060

-- Battle on the Broken Isles
local achievementLegion70 = 10876
local criteriaLegion70 = {
	[1] = 42063, -- Size Doesn't Matter
	[2] = 42165, -- Azsuna Specimens
	[3] = 42146, -- Dazed and Confused and Adorable
	[4] = 42159, -- Training with the Nightwatchers
	[5] = 42148, -- The Wine's Gone Bad
	[6] = 42154, -- Help a Whelp
	[7] = 42442, -- Fight Night: Amalia
	[8] = 40299, -- Fight Night: Bodhi Sunwayver
	[9] = 41881, -- Fight Night: Heliosus
	[10] = 40298, -- Fight Night: Sir Galveston
	[11] = 41886, -- Fight Night: Rats!
	[12] = 42062, -- Fight Night: Stitches Jr. Jr.
	[13] = 40277, -- Fight Night: Tiffany Nelson
	[14] = 40280, -- Training with Bredda
	[15] = 40282, -- Tiny Poacher, Tiny Animals
	[16] = 41766, -- Wildlife Protection Force
	[17] = 42064, -- It's Illid... Wait.
	[18] = 41687, -- Snail Fight!
	[19] = 41624, -- Rocko Needs a Shave
	[20] = 42067, -- All Howl, No Bite
	[21] = 41944, -- Jarrun's Ladder
	[22] = 41958, -- Oh, Ominitron
	[23] = 40278, -- My Beast's Bidding
	[24] = 41948, -- All Pets Go to Heaven
	[25] = 41935, -- Beasts of Burden
	[26] = 41895, -- The Master of Pets
	[27] = 41914, -- Clear the Catacombs
	[28] = 41990, -- Chopped
	[29] = 40337, -- Flummoxed
	[30] = 42015, -- Threads of Fate
	[31] = 41931, -- Mana Tap
	[32] = 40279, -- Training with Durian
	[33] = 41862, -- Only Pets Can Prevent Forest Fires
	[34] = 41861, -- Meet The Maw
	[35] = 41855, -- Stand Up to Bullies
	[36] = 42190, -- Wildlife Conservationist
	[37] = 41860 -- Dealing with Satyrs
}

-- Family Familiar
local achFamIDmeta = 9696
local achFamIDtoName = {
	[9686] = {"Aquatic Acquiescence", "Aquatic"},
	[9687] = {"Best of the Beasts", "Beast"},
	[9688] = {"Mousing Around", "Critter"},
	[9689] = {"Dragons!", "Dragonkin"},
	[9690] = {"Ragnaros, Watch and Learn", "Elemental"},
	[9691] = {"Flock Together", "Flying"},
	[9692] = {"Murlocs, Harpies, and Wolvar, Oh My!", "Humanoid"},
	[9693] = {"Master of Magic", "Magic"},
	[9694] = {"Roboteer", "Mechanical"},
	[9695] = {"The Lil' Necromancer", "Undead"}
}
local achFamIDorder = {
	[1] = { --Pet Journal
		[1] = 9692, [2] = 9689, [3] = 9691, [4] = 9695, [5] = 9688, [6] = 9693, [7] = 9690, [8] = 9687, [9] = 9686, [10] = 9694
	},
	[2] = { --Alphabetical
		[1] = 9686, [2] = 9687, [3] = 9688, [4] = 9689, [5] = 9690, [6] = 9691, [7] = 9692, [8] = 9693, [9] = 9694, [10] = 9695
	}
}

local typeID = {
	[1] = "Humanoid",
	[2] = "Dragonkin",
	[3] = "Flying",
	[4] = "Undead",
	[5] = "Critter",
	[6] = "Magic",
	[7] = "Elemental",
	[8] = "Beast",
	[9] = "Aquatic",
	[10] = "Mechanical"
}
local questFamiliar70 = {
	[42159] = "Nightwatcher Merayl",
	[42442] = "Amalia",
	[40299] = "Bodhi Sunwayver",
	[40298] = "Sir Galveston",
	[40277] = "Tiffany Nelson",
	[40280] = "Bredda Tenderhide",
	[40282] = "Grixis Tinypop",
	[41687] = "Odrogg",
	[41944] = "Trapper Jarrun",
	[40278] = "Robert Craig",
	[41895] = "Aulier",
	[41990] = "Varenne",
	[40337] = "Master Tamer Flummox",
	[40279] = "Durian Strongfruit",
	[41860] = "Xorvasc"
}

local questLegion72 = {
	[46111] = "Sissix",
	[46112] = "Madam Viciosa",
	[46113] = "Nameless Mystic"
}

-- https://wow.gamepedia.com/UiMapID
local zonesLegion70 = { -- 7.0 Legion
	[625] = "Dalaran",
	[630] = "Azsuna",
	[641] = "Val'sharah",
	[650] = "Highmountain",
	[634] = "Stormheim",
	[680] = "Suramar",
	--[1187] = "Azsuna", --Not sure why there's double
	--[1188] = "Val'sharah",
	--[1189] = "Highmountain",
	--[1190] = "Stormheim",
	--[1191] = "Suramar"
}
local zonesLegion72 = { [1192] = "Broken Shore" }
local zonesLegion73 = { -- 7.3 Argus
	[830] = "Krokuun",
	[882] = "Mac'Aree",
	[885] = "Antoran Wastes"
}
local zonesBattle80Z = { -- 8.0 Battle for Azeroth
	[862] = "Zuldazar",
	[863] = "Nazmir",
	[864] = "Vol'dun",
	
	[1193] = "Zuldazar", --Not sure why there's double
	[1194] = "Nazmir",
	[1195] = "Vol'dun",
}
local zonesBattle80KT = { -- 8.0 Battle for Azeroth
	[895] = "Tiragarde Sound",
	[896] = "Drustvar",
	[942] = "Stormsong Valley",
	
	[1196] = "Tiragarde Sound", --Not sure why there's double
	[1197] = "Drustvar",
	[1198] = "Stormsong Valley"
}
local zonesBattle82 = { -- 8.2 Rise of Azshara 
	[1462] = "Mechagon Island",
	[1355] = "Nazjatar"
	--[1504] = "Nazjatar" --Continent
}

-- 7.3 Family Fighter
local achFighterIDmeta = 12100
local achFighterIDtoName = {
	[12089] = {"Aquatic Assault", "Aquatic"},
	[12091] = {"Beast Blitz", "Beast"},
	[12092] = {"Critical Critters", "Critter"},
	[12093] = {"Draconic Destruction", "Dragonkin"},
	[12094] = {"Elemental Escalation", "Elemental"},
	[12095] = {"Fierce Fliers", "Flying"},
	[12096] = {"Humanoid Havoc", "Humanoid"},
	[12097] = {"Magical Mayhem", "Magic"},
	[12098] = {"Mechanical Melee", "Mechanical"},
	[12099] = {"Unstoppable Undead", "Undead"}
}
local achFighterIDorder = {
	[1] = { --Pet Journal
		[1] = 12096, [2] = 12093, [3] = 12095, [4] = 12099, [5] = 12092, [6] = 12097, [7] = 12094, [8] = 12091, [9] = 12089, [10] = 12098
	},
	[2] = { --Alphabetical
		[1] = 12089, [2] = 12091, [3] = 12092, [4] = 12093, [5] = 12094, [6] = 12095, [7] = 12096, [8] = 12097, [9] = 12098, [10] = 12099
	}
}

--http://www.wowhead.com/legion-quests/type:115?filter=8;3;70300
local fighterNPCs = {
	[49041] = {"Ruinhoof", 830},
	[49042] = {"Foulclaw", 830},
	[49043] = {"Baneglow", 830}, --Guessing 43
	[49044] = {"Retch", 830},
	[49045] = {"Deathscreech", 830},
	[49046] = {"Gnasher", 830},
	[49047] = {"Bucky", 882},
	[49048] = {"Snozz", 882}, --Guessing 48
	[49049] = {"Gloamwing", 882},
	[49050] = {"Shadeflicker", 882},
	[49051] = {"Corrupted Blood of Argus", 882},
	[49052] = {"Mar'cuus", 882},
	[49053] = {"Watcher", 885},
	[49054] = {"Bloat", 885},
	[49055] = {"Earseeker", 885},
	[49056] = {"Pilfer", 885},
	[49057] = {"Minixis", 885},
	[49058] = {"One-of-Many", 885}
}

-- 8.0 Battle on Zandalar and Kul Tiras
local achievementBattle80 = 12936
local criteriaBattle80 = {
	[1] = 52009, -- Crab People
	[2] = 52126, -- This Little Piggy Has Sharp Tusks
	[3] = 52165, -- Automated Chaos
	[4] = 52218, -- Night Horrors
	[5] = 52278, -- Rogue Azerite
	[6] = 52297, -- What's the Buzz?
	[7] = 52316, -- Sea Creatures Are Weird
	[8] = 52325, -- Captured Evil
	[9] = 52430, -- Not So Bad Down Here
	[10] = 52455, -- Unbreakable
	[11] = 52471, -- That's a Big Carcass
	[12] = 52751, -- Strange Looking Dogs
	[13] = 52754, -- Marshdwellers
	[14] = 52779, -- Crawg in the Bog
	[15] = 52799, -- Pack Leader
	[16] = 52803, -- Accidental Dread
	[17] = 52850, -- Keeyo's Champions of Vol'dun
	[18] = 52856, -- Snakes on a Terrace
	[19] = 52864, -- What Do You Mean, Mind Controlling Plants?
	[20] = 52878, -- Desert Survivors
	[21] = 52892, -- Critters are Friends, Not Food
	[22] = 52923, -- Add More to the Collection
	[23] = 52937, -- You've Never Seen Jammer Upset
	[24] = 52938  -- Small Beginnings
}

-- 8.1 Family Battler
local achFamBattlerIDmeta = 13279
local achFamBattlerIDtoName = {
	[13280] = {"Hobbyist Aquarist", "Aquatic"},
	[13270] = {"Beast Mode", "Beast"},
	[13271] = {"Critters With Huge Teeth", "Critter"},
	[13272] = {"Dragons Make Everything Better", "Dragonkin"},
	[13273] = {"Element of Success", "Elemental"},
	[13274] = {"Fun With Flying", "Flying"},
	[13281] = {"Human Resources", "Humanoid"},
	[13275] = {"Magician's Secrets", "Magic"},
	[13277] = {"Machine Learning", "Mechanical"},
	[13278] = {"Not Quite Dead Yet", "Undead"}
}
local achFamBattlerIDorder = {
	[1] = { --Pet Journal
		[1] = 13281, [2] = 13272, [3] = 13274, [4] = 13278, [5] = 13271, [6] = 13275, [7] = 13273, [8] = 13270, [9] = 13280, [10] = 13277
	},
	[2] = { --Alphabetical
		[1] = 13280, [2] = 13270, [3] = 13271, [4] = 13272, [5] = 13273, [6] = 13274, [7] = 13281, [8] = 13275, [9] = 13277, [10] = 13278
	}
}

local questFamBattler81 = {
	[1] = { --Tiragarde Sound
		[52471] = {"Delia Hanako", 895, 1196}, --That's a Big Carcass
		[52751] = {"Burly", 895, 1196}, --Strange Looking Dogs
		[52430] = {"Kwint", 895, 1196} --Not So Bad Down Here
		-- [not included] Unbreakable
	},
	[2] = { --Stormsong Valley
		[52325] = {"Leana Darkwind", 942, 1198}, --Captured Evil
		[52316] = {"Ellie Vern", 942, 1198}, --Sea Creatures Are Weird
		[52165] = {"Eddie Fixit", 942, 1198} --Automated Chaos
		-- [not included] This Little Piggy Has Sharp Tusks
	},
	[3] = { --Drustvar
		[52297] = {"Michael Skarn", 896, 1197}, --What's the Buzz?
		[52278] = {"Fizzie Sparkwhistle", 896, 1197}, --Rogue Azerite
		[52218] = {"Dilbert McClint", 896, 1197}, --Night Horrors
		[52009] = {"Captain Hermes", 896, 1197} --Crab People
	},
	[4] = { --Zuldazar
		[52923] = {"Talia Sparkbrow", 862, 1193}, --Add More to the Collection
		[52938] = {"Zujai", 862, 1193}, --Small Beginnings
		[52892] = {"Karaga", 862, 1193} --Critters are Friends, Not Food
		-- [not included] You've Never Seen Jammer Upset
	},
	[5] = { --Nazmir
		[52754] = {"Lozu", 863, 1194}, --Marshdwellers
		[52803] = {"Korval Darkbeard", 863, 1194}, --Accidental Dread
		[52799] = {"Grady Prett", 863, 1194} --Pack Leader
		-- [not included] Crawg in the Bog
	},
	[6] = { --Vol'dun
		[52850] = {"Keeyo", 864, 1195}, --Keeyo's Champions of Vol'dun
		[52878] = {"Kusa", 864, 1195}, --Desert Survivors
		[52856] = {"Sizzik", 864, 1195} --Snakes on a Terrace
		-- [not included] What Do You Mean, Mind Controlling Plants?
	}
}

local quest82 = {
	--[1] = {
		[56393] = {"Gnomefeaster", 1462},
		[56395] = {"Goldenbot XD", 1462},
		[56397] = {"CK-9 Micro-Oppression Unit", 1462},
		[56399] = {"Unit 6", 1462},
		[56394] = {"Sputtertube", 1462},
		[56396] = {"Creakclank", 1462},
		[56398] = {"Unit 35", 1462},
		[56400] = {"Unit 17", 1462},
	--},
	--[2] = {
		[56381] = {"Prince Wiggletail", 1355},
		[56383] = {"Silence", 1355},
		[56385] = {"Pearlhusk Crawler", 1355},
		[56387] = {"Ravenous Scalespawn", 1355},
		[56389] = {"Kelpstone", 1355},
		[56391] = {"Frenzied Knifefang", 1355},
		[56382] = {"Chomp", 1355},
		[56384] = {"Shadowspike Lurker", 1355},
		[56386] = {"Elderspawn of Nalaada", 1355},
		[56388] = {"Mindshackle", 1355},
		[56390] = {"Voltgorger", 1355},
		[56392] = {"Giant Opaline Conch", 1355},
	--}
}

--

local useOrder = 1;
local runonce = true
local f = nil
local fA = nil --Fighter/Argus
local currentWQ = {} -- All pet WQs
local missingWQs = {} -- Only Battle on the Broken Isles
local missingBattleWQs = {} -- Only Battle on the Broken Isles

--
local function SkinFrame(frame,name)
	if IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui") then
		if frame.StripTextures then frame:StripTextures() end
		if frame.CreateBackdrop then frame:CreateBackdrop("Transparent") end
		--local close = _G[name.."CloseButton"] or frame.CloseButton
		--if close and close.SetAlpha then
			--if ElvUI then ElvUI[1]:GetModule('Skins'):HandleCloseButton(close) end
			--if Tukui and Tukui[1] and Tukui[1].SkinCloseButton then Tukui[1].SkinCloseButton(close) end
			--close:SetAlpha(1)
		--end
	end
end

local function has_value (tab, val)
    for index, value in ipairs (tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function has_valueAlt (tab, val)
    for index, value in pairs (tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function table_count(tab)
	local count = 0
	if(tab ~= nil) then
		for _ in pairs(tab) do
			count = count + 1
		end
	end
	return count
end

local function DoChecksRewards()
	--print(addon.config.profile.notifyRewardItemsBattle) -- notifyRewardItemsLegion
	if(currentWQ ~= nil and UnitLevel("player") >= 110) then
		for questID,mapname in pairs(currentWQ) do
			if(C_QuestLog.IsQuestFlaggedCompleted(questID) == false) then
				local numQuestRewards = GetNumQuestLogRewards(questID)
				if (numQuestRewards > 0) then
					local itemName, itemTexture, quantity, quality, isUsable, itemID = GetQuestLogRewardInfo (1, questID)

					local textColZone = nil
					if((has_valueAlt(zonesLegion70, mapname) or has_valueAlt(zonesLegion72, mapname)) and addon.config.profile.notifyRewardItemsLegion) then
						textColZone = colGreen
					elseif(has_valueAlt(zonesLegion73, mapname) and addon.config.profile.notifyRewardItemsLegion) then
						textColZone = colPurple
					elseif(has_valueAlt(zonesBattle80Z, mapname) and addon.config.profile.notifyRewardItemsBattle) then
						textColZone = colRed
					elseif(has_valueAlt(zonesBattle80KT, mapname) and addon.config.profile.notifyRewardItemsBattle) then
						textColZone = colBlue
					elseif(has_valueAlt(zonesBattle82, mapname) and addon.config.profile.notifyRewardItemsBattle) then
						textColZone = colYellow
					end

					if(textColZone ~= nil and (addon.config.profile.notifyRewardCurrencies[itemID] or addon.config.profile.rewardVisible[itemID])) then
						local _, itemLink = GetItemInfo(itemID)
						if(quantity > 1) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": " .. itemLink .. "x" .. tostring(quantity) .. " in " .. textColZone .. mapname .. colReset .. ".")
						else
							print(colPink .. "CheckPetWQs" .. colReset .. ": " .. itemLink .. " in " .. textColZone .. mapname .. colReset .. ".")
						end
					end
				end
			end
		end
	end
end

local function DoChecks(force)
	missingWQs = {}
	missingBattleWQs = {}
	currentWQ = {}
	local somethingAvailableFF = 0
	local somethingAvailableFB = 0
	--local currentAreaID = C_Map.GetBestMapForUnit("player")

	-- Mostly made for Battle on the Broken Isles
	local _,_,_, completedIsles = GetAchievementInfo(achievementLegion70)
	local _,_,_, completedBattle = GetAchievementInfo(achievementBattle80)
	local numCriteria = GetAchievementNumCriteria(achievementLegion70)
	for k=1,numCriteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(achievementLegion70, k)
		if (cComp == false) then
			missingWQs[criteriaLegion70[k]] = true
		end
	end
	
	local numBattleCriteria = GetAchievementNumCriteria(achievementBattle80)
	for k=1,numBattleCriteria,1 do
		local cDesc, _, cComp = GetAchievementCriteriaInfo(achievementBattle80, k)
		if (cComp == false) then
			missingBattleWQs[criteriaBattle80[k]] = true
		end
	end
	
	local found = 0
	local foundFF = 0
	local foundFB = 0
	
	for uiMapID,mapname in pairs(zonesLegion70) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				local questID = info.questId
				
				if(has_value(criteriaLegion70, questID)) then
					found = found + 1
					currentWQ[questID] = mapname
					--print("Legion Exists: " .. tostring(questID));					
					C_TaskQuest.RequestPreloadRewardData(questID)
					if (completedIsles == false and addon.config.profile.autoIslesAch and missingWQs[questID] == true) then
						print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colGreen .. mapname .. colReset .. " pet battle you need to do.")
					end
				end
			end
		end
	end
	
	for uiMapID,mapname in pairs(zonesLegion72) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				local questID = info.questId
				
				if(questLegion72[questID] ~= nil) then
					found = found + 1
					currentWQ[questID] = mapname
					--print("Broken Shore Exists: " .. tostring(questID));
					C_TaskQuest.RequestPreloadRewardData(questID)
				end
			end
		end
	end
	
	for uiMapID,mapname in pairs(zonesLegion73) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				local questID = info.questId
				
				if(fighterNPCs[questID] ~= nil) then
					found = found + 1
					currentWQ[questID] = mapname
					--print("Argus Exists: " .. tostring(questID));
					C_TaskQuest.RequestPreloadRewardData(questID)
				end
			end
		end
	end
	
	-- Zandalar
	for uiMapID,mapname in pairs(zonesBattle80Z) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					if(has_value(criteriaBattle80, questID) and currentWQ[questID] == nil) then
						found = found + 1
						currentWQ[questID] = mapname
						--print("Battle Exists: " .. tostring(questID));					
						C_TaskQuest.RequestPreloadRewardData(questID)
						if (completedBattle == false and addon.config.profile.autoBattleAch and missingBattleWQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colRed .. mapname .. colReset .. " pet battle you need to do.")
						end
					end
					
					if(criteriaBattle80[questID] ~= nil) then
						found = found + 1
						currentWQ[questID] = mapname
						--print("Battle For Azeroth Exists: " .. tostring(questID));
						C_TaskQuest.RequestPreloadRewardData(questID)
					end
				end
			end
		end
	end
	
	-- Kul Tiras
	for uiMapID,mapname in pairs(zonesBattle80KT) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					if(has_value(criteriaBattle80, questID) and currentWQ[questID] == nil) then
						found = found + 1
						currentWQ[questID] = mapname
						--print("Battle Exists: " .. tostring(questID));					
						C_TaskQuest.RequestPreloadRewardData(questID)
						if (completedBattle == false and addon.config.profile.autoBattleAch and missingBattleWQs[questID] == true) then
							print(colPink .. "CheckPetWQs" .. colReset .. ": There's a " .. colBlue .. mapname .. colReset .. " pet battle you need to do.")
						end
					end
					
					if(criteriaBattle80[questID] ~= nil) then
						found = found + 1
						currentWQ[questID] = mapname
						--print("Battle For Azeroth Exists: " .. tostring(questID));
						C_TaskQuest.RequestPreloadRewardData(questID)
					end
				end
			end
		end
	end
	
	-- 8.2 Nazjatar and Mechagon
	for uiMapID,mapname in pairs(zonesBattle82) do
		local taskInfo = C_TaskQuest.GetQuestsForPlayerByMapID(uiMapID)
		if (taskInfo and #taskInfo > 0) then
			for i, info in ipairs (taskInfo) do
				if(info.mapID == uiMapID) then --Remove quests that are somehow visible from other maps
					local questID = info.questId
					if(quest82[questID] ~= nil) then
						found = found + 1
						currentWQ[questID] = mapname
						--print("BfA 8.2 Exists: " .. tostring(questID));
						C_TaskQuest.RequestPreloadRewardData(questID)
					end
				end
			end
		end
	end

	local cacheFound = table_count(CheckPetWQsCache)
	if(found >= 3) then
		--print("CheckPetWQs Familar: Found at least 3 quests, saving to cache.")
		CheckPetWQsCache = currentWQ
	elseif(found > 0) then
		--print("CheckPetWQs Familar: Need to figure out which quests have been done, and save to cache.")
		for questID,tamer in pairs(questFamiliar70) do
			if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
				currentWQ[questID] = "Unknown"
			end
		end
		for order,zInfo in ipairs(questFamBattler81) do
			for questID,tamer in pairs(zInfo) do
				if(C_QuestLog.IsQuestFlaggedCompleted(questID)) then
					currentWQ[questID] = "Unknown"
				end
			end
		end
		CheckPetWQsCache = currentWQ
	else
		--print("CheckPetWQs Familar: Found no quests, using cache instead.")
		currentWQ = CheckPetWQsCache
	end
	
	local txtTamerInfo = ""
	local txtTamerInfoZone = ""
	local txtTamerInfoNum = ""
	local txtTypeInfo = ""
	
	local numCriteria70 = 0
	local numCriteria81 = 0
	if(currentWQ ~= nil) then
		-- Family Familar
		for questID,mapname in pairs(currentWQ) do
			if (questFamiliar70[questID] ~= nil) then -- exists, as in is FF
				local tamer70 = questFamiliar70[questID]
			
				foundFF = foundFF + 1
				local numComp = 0
				local txtcriteria = ""
				for order,achID in ipairs(achFamIDorder[useOrder]) do
					local achName = achFamIDtoName[achID][1]
					local achType = achFamIDtoName[achID][2]
					local _,_,_, achComp = GetAchievementInfo(achID)
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

						if(cDesc == tamer70) then
							local add = ""
							if(cComp == true) then --Criteria
								numComp = numComp + 1
								add = colGrey .. string.sub(achType, 1, 3) .. colReset
							elseif(achComp == true) then
								add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
							else
								numCriteria70 = numCriteria70 + 1
								add = string.sub(achType, 1, 3)
							end
							
							if(achID == achFamIDorder[useOrder][1]) then
								txtcriteria = add
							else
								txtcriteria = txtcriteria .. " " .. add
							end
						end
					end
				end

				local availabilty = colGrey .. mapname .. colReset
				if(C_QuestLog.IsQuestFlaggedCompleted(questID) == false) then
					availabilty = colGreen .. mapname .. colReset
					somethingAvailableFF = true
				elseif(force == true) then
					somethingAvailableFF = true
				end

				if(txtTamerInfo == "") then
					txtTamerInfo = questFamiliar70[questID]
					txtTamerInfoZone = availabilty
					txtTamerInfoNum = tostring(numComp) .. " / 10"
					txtTypeInfo = txtcriteria
				else
					txtTamerInfo = txtTamerInfo .. "|n" .. questFamiliar70[questID]
					txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
					txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
					txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
				end
			end
		end
	end

	if(txtTamerInfo ~= "") then
		txtTamerInfo = txtTamerInfo .. "|n"
		txtTamerInfoZone = txtTamerInfoZone .. "|n"
		txtTamerInfoNum = txtTamerInfoNum .. "|n"
		txtTypeInfo = txtTypeInfo .. "|n"
	end
	
	for qID,npcInfo in pairs(fighterNPCs) do
		local numCriteria73 = 0
		local numComp = 0
		local txtcriteria = ""
		
		for order,achID in ipairs(achFighterIDorder[useOrder]) do
			local achName = achFighterIDtoName[achID][1]
			local achType = achFighterIDtoName[achID][2]
			--local _,_,_, achComp = GetAchievementInfo(achID)
			local numCriteriaFam = GetAchievementNumCriteria(achID)
			for k=1,numCriteriaFam,1 do
				local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

				if(cDesc == npcInfo[1]) then
					local add = ""
					if(cComp == true) then --Criteria
						numComp = numComp + 1
						add = colGrey .. string.sub(achType, 1, 3) .. colReset
					else
						numCriteria73 = numCriteria73 + 1
						add = string.sub(achType, 1, 3)
					end

					if(achID == achFighterIDorder[useOrder][1]) then
						txtcriteria = add
					else
						txtcriteria = txtcriteria .. " " .. add
					end
				end
			end
		end
		
		if(txtTamerInfo == "") then
			txtTamerInfo = colWhite .. npcInfo[1]
			txtTamerInfoZone = colPurple .. zonesLegion73[npcInfo[2]] .. colReset
			txtTamerInfoNum = tostring(numComp) .. " / 10"
			txtTypeInfo = txtcriteria
		else
			txtTamerInfo = txtTamerInfo .. "|n" .. npcInfo[1]
			txtTamerInfoZone = txtTamerInfoZone .. "|n" .. colPurple .. zonesLegion73[npcInfo[2]] .. colReset
			txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
			txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
		end
	end
	
	if(txtTamerInfo ~= "") then
		txtTamerInfo = txtTamerInfo .. "|n"
		txtTamerInfoZone = txtTamerInfoZone .. "|n"
		txtTamerInfoNum = txtTamerInfoNum .. "|n"
		txtTypeInfo = txtTypeInfo .. "|n"
	end
	
	for order,zInfo in ipairs(questFamBattler81) do
		for questID,qInfo in pairs(zInfo) do
			local mapname = "Unknown"
			if(zonesBattle80Z[qInfo[2]] ~= nil) then
				mapname = zonesBattle80Z[qInfo[2]]
			elseif(zonesBattle80KT[qInfo[2]] ~= nil) then
				mapname = zonesBattle80KT[qInfo[2]]
			end

			local tamer81 = zInfo[questID][1]
			foundFB = foundFB + 1
			local numComp = 0
			local txtcriteria = ""
			for order,achID in ipairs(achFamBattlerIDorder[useOrder]) do
				local achName = achFamBattlerIDtoName[achID][1]
				local achType = achFamBattlerIDtoName[achID][2]
				local _,_,_, achComp = GetAchievementInfo(achID)
				local numCriteriaFam = GetAchievementNumCriteria(achID)
				for k=1,numCriteriaFam,1 do
					local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)

					if(cDesc == tamer81) then
						local add = ""
						if(cComp == true) then --Criteria
							numComp = numComp + 1
							add = colGrey .. string.sub(achType, 1, 3) .. colReset
						elseif(achComp == true) then
							add = colGrey .. string.sub(achType, 1, 2) .. "_" .. colReset
						else
							numCriteria81 = numCriteria81 + 1
							add = string.sub(achType, 1, 3)
						end
						
						if(achID == achFamBattlerIDorder[useOrder][1]) then
							txtcriteria = add
						else
							txtcriteria = txtcriteria .. " " .. add
						end
					end
				end
			end

			local availabilty = colGrey .. mapname .. colReset
			if(has_valueAlt(zonesBattle80Z, mapname)) then
				availabilty = colRed .. mapname .. colReset
			else
				availabilty = colBlue .. mapname .. colReset
			end

			if(txtTamerInfo == "") then
				txtTamerInfo = zInfo[questID][1]
				txtTamerInfoZone = availabilty
				txtTamerInfoNum = tostring(numComp) .. " / 10"
				txtTypeInfo = txtcriteria
			else
				txtTamerInfo = txtTamerInfo .. "|n" .. zInfo[questID][1]
				txtTamerInfoZone = txtTamerInfoZone .. "|n" .. availabilty
				txtTamerInfoNum = txtTamerInfoNum .. "|n" .. tostring(numComp) .. " / 10"
				txtTypeInfo = txtTypeInfo .. "|n" .. txtcriteria
			end
		end
	end

	txtTamerInfo = txtTamerInfo .. colReset
	fA.Content.TamerInfo:SetText(txtTamerInfo)
	fA.Content.TamerInfoZone:SetText(txtTamerInfoZone)
	fA.Content.TamerInfoNum:SetText(txtTamerInfoNum)
	fA.Content.TypeInfo:SetText(txtTypeInfo)
	
	if((UnitLevel("player") < 110 or addon.config.profile.autoWindow == false) and force == false) then
		-- Don't display on characters that can't do Legion WQs
		somethingAvailableFF = false;
	end
	if(force) then
		somethingAvailableFF = true;
	end

	return somethingAvailableFF, numCriteria70, numCriteria81
end

local function PreDoChecks(force, checkRewards)
	useOrder = 1;
	if(addon.config.profile.orderTypesAlpha) then
		useOrder = 2
	end

	if(fA == nil) then
		fA = CheckPetWQsFighter
		fA.Title:SetText("CheckPetWQs: Family Familiar / Fighter / Battler")
		fA:SetScript("OnKeyDown", function(self,key) 
			if key == "ESCAPE" then
				fA:SetPropagateKeyboardInput(false)
				fA:Hide(); 
			end 
		end)
		fA:EnableKeyboard(true)
	end
	  
	local somethingAvailableFF, numCriteria70, numCriteria81 = DoChecks(force)
	if(checkRewards) then
		C_Timer.After(2, function() DoChecksRewards() end) -- Sometimes just need to do this later
	end
	
	-- Family Familiar
	local _,_,_, completedMeta70 = GetAchievementInfo(achFamIDmeta)
	if(somethingAvailableFF == true) then
		if(numCriteria70 == 0 and force == false) then
			if(addon.config.profile.notifyNoFF and completedMeta70 == false) then
				print(colPink .. "CheckPetWQs" .. colReset .. ": None of the available Family Familiar WQs are required. Force open the window with: /ff")
			end
		else
			fA:Show()
			
			SkinFrame(fA, fA:GetName())
			fA:SetPropagateKeyboardInput(true)
		end
	elseif(addon.config.profile.notifyNoFF and completedMeta70 == false and UnitLevel("player") >= 110) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": No available WQs for Family Familiar found.")
	end
	-- Family Battler
	local _,_,_, completedMeta81 = GetAchievementInfo(achFamBattlerIDmeta)
	if(completedMeta81 == false and force == false and UnitLevel("player") >= 120) then
		print(colPink .. "CheckPetWQs" .. colReset .. ": Check your progress towards the 'Family Battler' achievement with /ff or /fb")
	end
	
	-- Get the base widths
	local widthType = ceil(fA.Content.TamerInfo:GetStringWidth()) + 5
	local widthTypeZone = ceil(fA.Content.TamerInfoZone:GetStringWidth()) + 5
	local widthTypeNum = ceil(fA.Content.TamerInfoNum:GetStringWidth()) + 5
	local widthOne = ceil(fA.Content.TypeInfo:GetStringWidth()) + 10

	fA.Content.TamerInfo:SetWidth(widthType)
	fA.Content.TamerInfoZone:SetWidth(widthTypeZone)
	fA.Content.TamerInfoNum:SetWidth(widthTypeNum)
	fA.Content.TypeInfo:SetWidth(widthOne)

	fA.Content.TamerInfo:SetPoint("TOPLEFT", 0, 0)
	fA.Content.TamerInfoZone:SetPoint("TOPLEFT", widthType + 5, 0)
	fA.Content.TamerInfoNum:SetPoint("TOPLEFT", widthType + widthTypeZone, 0)
	fA.Content.TypeInfo:SetPoint("TOPLEFT", widthType + widthTypeZone + widthTypeNum, 0)
	
	local _, _, _, xOffset = fA.Content.TypeInfo:GetPoint()
	local totalWidth = xOffset + widthOne
	fA:SetSize(totalWidth + 10, fA.Content.TypeInfo:GetHeight() + 50)
	fA.Content:SetSize(totalWidth, 0)
end
--

local CheckPetWQs = CreateFrame("Frame")
CheckPetWQs:RegisterEvent ("PLAYER_ENTERING_WORLD")
CheckPetWQs:RegisterEvent ("PLAYER_STARTED_MOVING")
CheckPetWQs:SetScript("OnEvent", function(self, event, ...)
	CheckPetWQs:UnregisterEvent ("PLAYER_ENTERING_WORLD")
	CheckPetWQs:UnregisterEvent ("PLAYER_STARTED_MOVING")

	local inInstance, instanceType = IsInInstance()
	if(inInstance) then
		return
	end
	
	if(runonce == true) then
		runonce = false;
		C_Timer.After(2, function() PreDoChecks(false, true) end)
	end
end)

local function CheckTarget(textCol, name, tamer, achIDorder, achIDtoName, levelCheck)
	if tamer == name then
		local _, _, petLevel1, _, _, _, _, _, _, petType1 = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(1))
		local _, _, petLevel2, _, _, _, _, _, _, petType2 = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(2))
		local _, _, petLevel3, _, _, _, _, _, _, petType3 = C_PetJournal.GetPetInfoByPetID(C_PetJournal.GetPetLoadOutInfo(3))
		--print (typeID[petType1] .. " " .. typeID[petType2] .. " " .. typeID[petType3])
		
		if(petType1 == petType2 and petType2 == petType3) then
			for order,achID in ipairs(achIDorder[useOrder]) do
				if(achIDtoName[achID] ~= nil) then
					local achName = achIDtoName[achID][1]
					local achType = achIDtoName[achID][2]
					local numCriteriaFam = GetAchievementNumCriteria(achID)
					for k=1,numCriteriaFam,1 do
						local cDesc, _, cComp = GetAchievementCriteriaInfo(achID, k)
						if(cDesc == tamer and achType == typeID[petType1] and cComp == true) then
							print(textCol .. "CheckPetWQs" .. colReset .. ": Already completed " .. achType .. " for " .. tamer .. ".")
							return;
						elseif(levelCheck and (petLevel1 < 25 or petLevel2 < 25 or petLevel3 < 25)) then
							print(textCol .. "CheckPetWQs" .. colReset .. ": One of your pets isn't 25, it might not count for this achievement.")
							return
						end
					end
				end
			end
		else
			print(textCol .. "CheckPetWQs" .. colReset .. ": Your team is not all the same type.")
		end
	end
end

local frame2 = CreateFrame("Frame")
frame2:RegisterEvent("PLAYER_TARGET_CHANGED")
frame2:SetScript("OnEvent", function(self, event, ...)
	local name = UnitName("target")
	local currentAreaID = C_Map.GetBestMapForUnit("player")
	
	if(addon.config.profile.notifyWarnings and UnitInRaid("player") ~= 1 and name ~= nil) then
		if(zonesLegion70[currentAreaID] ~= null) then
			for qID,tamer in pairs(questFamiliar70) do
				CheckTarget(colPink, name, tamer, achFamIDorder, achFamIDtoName, false)
			end
		end

		if(zonesLegion73[currentAreaID] ~= null) then
			for qID,nInfo in pairs(fighterNPCs) do
				CheckTarget(colPurple, name, nInfo[1], achFighterIDorder, achFighterIDtoName, false)
			end
		end
	end
	
	if(addon.config.profile.notifyWarningsFB and UnitInRaid("player") ~= 1 and name ~= nil) then
		if(zonesBattle80Z[currentAreaID] ~= null) then
			for order,zInfo in ipairs(questFamBattler81) do
				for qID,nInfo in pairs(zInfo) do
					CheckTarget(colRed, name, nInfo[1], achFamBattlerIDorder, achFamBattlerIDtoName, true)
				end
			end
		end
		
		if(zonesBattle80KT[currentAreaID] ~= null) then
			for order,zInfo in ipairs(questFamBattler81) do
				for qID,nInfo in pairs(zInfo) do
					CheckTarget(colBlue, name, nInfo[1], achFamBattlerIDorder, achFamBattlerIDtoName, true)
				end
			end
		end
	end
end)

SLASH_CHECKPETWQS1 = '/checkpetwqs';
SLASH_CHECKPETWQS2 = '/ff';
SLASH_CHECKPETWQS3 = '/fb';
SLASH_CHECKPETWQS4 = '/cpwqs';
SLASH_CHECKPETWQS5 = '/cpwq';
function SlashCmdList.CHECKPETWQS(msg, editbox)
	runonce = false;
	PreDoChecks(true, true)
end

local defaults = {
	profile = {
		autoBattleAch = true,
		autoIslesAch = true,
		orderTypesAlpha = false;
		notifyWarningsFB = true,
		autoWindow = true,
		notifyNoFF = true,
		notifyWarnings = true,
		notifyRewardItemsBattle = true,
		notifyRewardItemsLegion = false,
		notifyRewardCurrencies = {
			[163036] = true,
		},
		rewardVisible = {
			[92682] = true,
			[92683] = true,
			[98715] = true,
			[127755] = true,
			[122457] = true,
			[92665] = true,
			[92675] = true,
			[92676] = true,
			[92677] = true,
			[92678] = true,
			[92679] = true,
			[92680] = true,
			[92681] = true,
			[92741] = true,
		}
	}
}

local rewardList = {
	[98715] = "|T667492:0|tMarked Flawless Battle-Stone",
	[92741] = "|T667492:0|tFlawless Battle-Stone",
	[92679] = "|T666978:0|tFlawless Aquatic Battle-Stone",
	[92675] = "|T666951:0|tFlawless Beast Battle-Stone",
	[92676] = "|T666954:0|tFlawless Critter Battle-Stone",
	[92683] = "|T666957:0|tFlawless Dragonkin Battle-Stone",
	[92665] = "|T666960:0|tFlawless Elemental Battle-Stone",
	[92677] = "|T666963:0|tFlawless Flying Battle-Stone",
	[92682] = "|T666966:0|tFlawless Humanoid Battle-Stone",
	[92678] = "|T666969:0|tFlawless Magic Battle-Stone",
	[92680] = "|T666972:0|tFlawless Mechanical Battle-Stone",
	[92681] = "|T666975:0|tFlawless Undead Battle-Stone",

	[122457] = "|T667491:0|tUltimate Battle-Training Stone",
	[127755] = "|T667493:0|tFel-Touched Battle-Training Stone",
	
	[116429] = "|T1045111:0|tFlawless Battle-Training Stone",
	[116424] = "|T1045115:0|tAquatic Battle-Training Stone",
	[116374] = "|T1045105:0|tBeast Battle-Training Stone",
	[116418] = "|T1045106:0|tCritter Battle-Training Stone",
	[116419] = "|T1045107:0|tDragonkin Battle-Training Stone",
	[116420] = "|T1045108:0|tElemental Battle-Training Stone",
	[116421] = "|T1045109:0|tFlying Battle-Training Stone",
	[116416] = "|T1045110:0|tHumanoid Battle-Training Stone",
	[116422] = "|T1045112:0|tMagic Battle-Training Stone",
	[116417] = "|T1045113:0|tMechanical Battle-Training Stone",
	[116423] = "|T1045114:0|tUndead Battle-Training Stone"
}
local rewardTokens = {
	[163036] = "|T2004597:0|tPolished Pet Charm",
	[116415] = "|T413584:0|tShiny Pet Charm"
}

local function getConfigOptions()
	local options = {
		name = addon_name,
		type = 'group',
		args = {
			sectionGeneral = {
				type = 'group',
				name = "General",
				order = 10,
				inline = true,
				args = {
					autoBattleAch = {
						type = "toggle",
						name = "Battle on Zandalar and Kul Tiras",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoBattleAch = val; end,
						get = function(info) return addon.config.profile.autoBattleAch end,
						order = 1,
					},
					autoIslesAch = {
						type = "toggle",
						name = "Battle on the Broken Isles",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoIslesAch = val; end,
						get = function(info) return addon.config.profile.autoIslesAch end,
						order = 2,
					},
					orderTypesAlpha = {
						type = "toggle",
						name = "Order Types Alphabetically",
						width = 1.6,
						set = function(info,val)
							addon.config.profile.orderTypesAlpha = val;
							if(fA:IsShown()) then PreDoChecks(true, false) end
						end,
						get = function(info) return addon.config.profile.orderTypesAlpha end,
						order = 2,
					},
				}
			},
			sectionFamilyBattler = {
				type = 'group',
				name = "Battle for Azeroth: Family Battler",
				order = 20,
				inline = true,
				args = {
					notifyWarningsFB = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarningsFB = val; end,
						get = function(info) return addon.config.profile.notifyWarningsFB end,
						order = 1,
					}
				}
			},
			sectionLegion = {
				type = 'group',
				name = "Legion: Family Familiar and Family Fighter",
				order = 30,
				inline = true,
				args = {
					autoWindow = {
						type = "toggle",
						name = "Automatically open window",
						width = 1.6,
						set = function(info,val) addon.config.profile.autoWindow = val; end,
						get = function(info) return addon.config.profile.autoWindow end,
						order = 1,
					},
					notifyNoFF = {
						type = "toggle",
						name = "Notify when there's no available quests",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyNoFF = val; end,
						get = function(info) return addon.config.profile.notifyNoFF end,
						order = 2,
					},
					notifyWarnings = {
						type = "toggle",
						name = "Check team when targetting tamer",
						width = 1.6,
						set = function(info,val) addon.config.profile.notifyWarnings = val; end,
						get = function(info) return addon.config.profile.notifyWarnings end,
						order = 3,
					}
				}
			},
			sectionRewards = {
				type = 'group',
				name = "Reward Notifications",
				order = 40,
				inline = true,
				args = {
					notifyRewardItemsBattle = {
						type = "toggle",
						name = "Battle for Azeroth",
						width = "normal",
						set = function(info,val) addon.config.profile.notifyRewardItemsBattle = val; end,
						get = function(info) return addon.config.profile.notifyRewardItemsBattle end,
						order = 1,
					},
					notifyRewardItemsLegion = {
						type = "toggle",
						name = "Legion",
						width = "half",
						set = function(info,val) addon.config.profile.notifyRewardItemsLegion = val; end,
						get = function(info) return addon.config.profile.notifyRewardItemsLegion end,
						order = 2,
					},
					allTick = {
						type = "execute",
						name = "Tick",
						width = "half",
						func = function()
							for id, reward in next, rewardTokens do
								addon.config.profile.notifyRewardCurrencies[id] = true
							end
							for id, reward in next, rewardList do
								addon.config.profile.rewardVisible[id] = true
							end
						end,
						order = 3
					},
					allUntick = {
						type = "execute",
						name = "Untick",
						width = "half",
						func = function()
							for id, reward in next, rewardTokens do
								addon.config.profile.notifyRewardCurrencies[id] = false
							end
							for id, reward in next, rewardList do
								addon.config.profile.rewardVisible[id] = false
							end
						end,
						order = 4
					},
					notifyRewardCurrencies = {
						type = "multiselect",
						name = "Check for currencies",
						values = rewardTokens,
						set = function(info, key,val) addon.config.profile.notifyRewardCurrencies[key] = val; end,
						get = function(info, key) return addon.config.profile.notifyRewardCurrencies[key] end,
						order = 5,
					},
					rewardVisible = {
						type = "multiselect",
						name = "Check for rewards",
						values = rewardList,
						set = function(info, key,val) addon.config.profile.rewardVisible[key] = val; end,
						get = function(info, key) return addon.config.profile.rewardVisible[key] end,
						order = 6,
					}
				}
			}
		}
	}
	
	return options;
end

function addon:OnInitialize()
	self.config = LibStub("AceDB-3.0"):New("CheckPetWQsConfig", defaults, true)
    self.options = getConfigOptions()
    
    LibStub("AceConfig-3.0"):RegisterOptionsTable(self.name, self.options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(self.name, self.name, nil)
end