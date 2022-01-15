--- Dozer - RESULT "NOT" SIMPLE FM.
-- Dozer is result skin for beatoraja
-- It is based on "RESULT SIMPLE FM" and "RESULT SIMPLE FM for beatoraja".
-- @author Suzu Yuuki
-- @release 1.2.0

local header = {
	type = 7,
	name = "Dozer - RESULT \"NOT\" SIMPLE FM 1.2.0",
	w = 1920,
	h = 1080,
	playstart = 1000,
	scene = 3600000,
	input = 500,
	close = 1500,
	fadeout = 1000,
	category = {
		{
			name = "Main Customize", item = {
				"Background Image",
				"Layer Image",
				"Graph Side",
				"Difficulty 5 (INSANE) String",
				"Timing (FAST/SLOW) String",
				"Show Current Time",
				"Ending Animation"
			}
		},
		{
			name = "Background Image Customize", item = {
				"Background AAA",
				"Background AA",
				"Background A",
				"Background CLEAR",
				"Background FAILED",
				"Background ALL"
			}
		},
		{
			name = "Layer Image Customize", item = {
				"Layer AAA",
				"Layer AA",
				"Layer A",
				"Layer CLEAR",
				"Layer FAILED",
				"Layer ALL"
			}
		}
	},
	property = {
		{
			name = "Background Image", category = "Background Image", item = {
				{ name = "According to Rank", op = 901 },
				{ name = "Clear or Failed", op = 902 },
				{ name = "All", op = 903 },
			}
		},
		{
			name = "Layer Image", category = "Layer Image", item = {
				{ name = "According to Rank", op = 904 },
				{ name = "Clear or Failed", op = 905 },
				{ name = "All", op = 906 },
			}
		},
		{
			name = "Graph Side", category = "Graph Side", item = {
				{ name = "Left", op = 907 },
				{ name = "Right", op = 908 },
			}
		},
		{
			name = "Difficulty 5 (INSANE) String", category = "Difficulty 5 (INSANE) String", item = {
				{ name = "INSANE", op = 909 },
				{ name = "(BLACK) ANOTHER", op = 910 },
			}
		},
		{
			name = "Timing (FAST/SLOW) String", category = "Timing (FAST/SLOW) String", item = {
				{ name = "FAST/SLOW", op = 911 },
				{ name = "EARLY/LATE", op = 912 },
			}
		},
		{
			name = "Show Current Time", category = "Show Current Time", item = {
				{ name = "Off", op = 913 },
				{ name = "Show Date (y/M/d)", op = 914 },
				{ name = "Show Date and Time (y/M/d H:m:s)", op = 915 },
			}
		},
	},
	filepath = {
		-- { name = "-------- Background Image Customize", category = "Background Image Customize", path = "_dummy/*" },
		{ name = "Background AAA", category = "Background AAA", path = "background/AAA/*.png", def = "Random" },
		{ name = "Background AA", category = "Background AA", path = "background/AA/*.png", def = "Random" },
		{ name = "Background A", category = "Background A", path = "background/A/*.png", def = "Random" },
		{ name = "Background CLEAR", category = "Background CLEAR", path = "background/CLEAR/*.png", def = "Random" },
		{ name = "Background FAILED", category = "Background FAILED", path = "background/FAILED/*.png", def = "Random" },
		{ name = "Background ALL", category = "Background ALL", path = "background/ALL/*.png", def = "Random" },
		-- { name = "-------- Layer Image Customize", category = "Layer Image Customize", path = "_dummy/*" },
		{ name = "Layer AAA", category = "Layer AAA", path = "layer/AAA/*.png", def = "Random" },
		{ name = "Layer AA", category = "Layer AA", path = "layer/AA/*.png", def = "Random" },
		{ name = "Layer A", category = "Layer A", path = "layer/A/*.png", def = "Random" },
		{ name = "Layer CLEAR", category = "Layer CLEAR", path = "layer/CLEAR/*.png", def = "Random" },
		{ name = "Layer FAILED", category = "Layer FAILED", path = "layer/FAILED/*.png", def = "Random" },
		{ name = "Layer ALL", category = "Layer ALL", path = "layer/ALL/*.png", def = "Random" },
		-- { name = "-------- Layer Animation Customize", path = "_dummy/*" },
		{ name = "Layer Animation", path = "layer/animation/*", def = "NoAnimation" },
		-- { name = "-------- Rank Image Customize", path = "_dummy/*" },
		{ name = "Rank Image", path = "parts/rank/*", def = "Default" },
		-- { name = "-------- Stage File Surrogate Image Customize", path = "_dummy/*" },
		{ name = "Stage File Surrogate", path = "parts/StageFileSurrogate/*.png", def = "#Default" },
		{ name = "Ending Animation", category = "Ending Animation", path = "ending/*", def = "FadeOut" },
	},
	offset = {
		-- カスタムオフセット
	}
}

-- --------------------------------
-- -------- モジュール定義
-- --------------------------------

--- main_state module.
local main_state = require("main_state")

-- --------------------------------
-- -------- 汎用メソッド定義
-- --------------------------------

--- valueList 内のすべての要素を list へ追加します.
-- @param list 追加対象のリスト (table)
-- @param valueList 追加する要素のリスト
local function insertAll(list, valueList)
	for _, v in ipairs(valueList) do
		table.insert(list, v)
	end
end

-- --------------------------------
-- -------- カスタマイズオプション判定メソッド定義
-- --------------------------------

--- 背景をランクに応じて表示するかどうか.
local function isBgByRank()
	return skin_config.option["Background Image"] == 901
end

--- 背景をランクやクリアに関わらず同じものを表示するかどうか.
local function isBgAll()
	return skin_config.option["Background Image"] == 903
end

--- レイヤをランクに応じて表示するかどうか.
local function isLayerByRank()
	return skin_config.option["Layer Image"] == 904
end

--- レイヤをランクやクリアに関わらず同じものを表示するかどうか.
local function isLayerAll()
	return skin_config.option["Layer Image"] == 906
end

--- グラフを右側に表示するかどうか.
local function isGraphSideRight()
	return skin_config.option["Graph Side"] == 908
end

--- INSANE の代わりに (BLACK) ANOTHER 表記を使用するかどうか.
local function useBlackAnother()
	return skin_config.option["Difficulty 5 (INSANE) String"] == 910
end

--- FAST/SLOW の代わりに EARLY/LATE 表記を使用するかどうか.
local function useEarlyLate()
	return skin_config.option["Timing (FAST/SLOW) String"] == 912
end

--- 現在の日付や時刻を表示するかどうか.
local function isShowCurrentTime()
	return skin_config.option["Show Current Time"] ~= 913
end

--- 現在日付表示で時刻を表示するかどうか.
local function isShowDateAndTime()
	return skin_config.option["Show Current Time"] == 915
end

-- --------------------------------
-- -------- 外部 lua 呼び出しメソッド定義
-- --------------------------------

--- レイヤアニメーションの定義ファイルを読み込みます.
-- @skin main メソッドの変数 "skin"
-- @param ids destination に設定する id のリスト
-- @param ops destination に設定する op のリスト
local function loadCustomLayerAnimationScript(skin, ids, ops)
	local customPath = skin_config.get_path("layer/animation/*") .. "/layer.lua"
	local status, parts = pcall(function()
		return dofile(customPath).load(ids, ops)
	end)
	if status then
		for _, v in ipairs(parts.destination) do
			table.insert(skin.destination, v)
		end
	end
end

--- ランク表示の定義ファイルを読み込みます.
-- @skin main メソッドの変数 "skin"
-- @param basePosLeftInfo デフォルトの左オフセットです。グラフサイドにより変化します。
--                        グラフサイド 左: 0 右: 1344
local function loadCustomRankScript(skin, basePosLeft)
	local customPath = skin_config.get_path("parts/rank/*") .. "/rank.lua"
	local status, parts = pcall(function()
		return dofile(customPath).load(15, basePosLeft)
	end)
	if status then
		for _, v in ipairs(parts.image) do
			table.insert(skin.image, v)
		end
		for _, v in ipairs(parts.destination) do
			table.insert(skin.destination, v)
		end
	end
end

--- 終了アニメーションの定義ファイルを読み込みます.
-- @skin main メソッドの変数 "skin"
local function loadCustomEndingAnimationScript(skin)
	local customPath = skin_config.get_path("ending/*") .. "/ending.lua"
	local status, parts = pcall(function()
		return dofile(customPath).load()
	end)
	if status then
		if parts.source then
			for _, v in ipairs(parts.source) do
				table.insert(skin.source, v)
			end
		end
		if parts.image then
			for _, v in ipairs(parts.image) do
				table.insert(skin.image, v)
			end
		end
		if parts.destination then
			for _, v in ipairs(parts.destination) do
				table.insert(skin.destination, v)
			end
		end
	end
end

-- --------------------------------
-- -------- メインメソッド
-- --------------------------------

local function main()
	-- ヘッダ情報をスキン本体にコピーします
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end
	-- 以下でスキン本体のデータを定義します
	skin.source = {
		{ id = 0, path = "background/AAA/*.png" },
		{ id = 1, path = "background/AA/*.png" },
		{ id = 2, path = "background/A/*.png" },
		{ id = 3, path = "background/CLEAR/*.png" },
		{ id = 4, path = "background/FAILED/*.png" },
		{ id = 5, path = "background/ALL/*.png" },
		{ id = 6, path = "layer/AAA/*.png" },
		{ id = 7, path = "layer/AA/*.png" },
		{ id = 8, path = "layer/A/*.png" },
		{ id = 9, path = "layer/CLEAR/*.png" },
		{ id = 10, path = "layer/FAILED/*.png" },
		{ id = 11, path = "layer/ALL/*.png" },
		{ id = 12, path = "parts/parts.png" },
		{ id = 13, path = "parts/number.png" },
		{ id = 14, path = "parts/cleartype.png" },
		{ id = 15, path = "parts/rank/*/rank.png" },
		{ id = 16, path = "parts/StageFileSurrogate/*.png" },
	}
	skin.font = {
		{ id = 0, path = "font/GenShinGothic-Heavy.ttf" },
	}
	skin.image = {
		-- bg
		{ id = "bgAAA", src = 0, x = 0, y = 0, w = -1, h = -1 },
		{ id = "bgAA", src = 1, x = 0, y = 0, w = -1, h = -1 },
		{ id = "bgA", src = 2, x = 0, y = 0, w = -1, h = -1 },
		{ id = "bgClear", src = 3, x = 0, y = 0, w = -1, h = -1 },
		{ id = "bgFailed", src = 4, x = 0, y = 0, w = -1, h = -1 },
		{ id = "bgAll", src = 5, x = 0, y = 0, w = -1, h = -1 },
		-- layer
		{ id = "lyAAA", src = 6, x = 0, y = 0, w = -1, h = -1 },
		{ id = "lyAA", src = 7, x = 0, y = 0, w = -1, h = -1 },
		{ id = "lyA", src = 8, x = 0, y = 0, w = -1, h = -1 },
		{ id = "lyClear", src = 9, x = 0, y = 0, w = -1, h = -1 },
		{ id = "lyFailed", src = 10, x = 0, y = 0, w = -1, h = -1 },
		{ id = "lyAll", src = 11, x = 0, y = 0, w = -1, h = -1 },
		-- common chars
		{ id = "lblWhitePeriod", src = 12, x = 103, y = 152, w = 5, h = 4 },
		{ id = "lblWhitePercent", src = 12, x = 84, y = 140, w = 15, h = 16 },
		{ id = "lblThrash", src = 12, x = 124, y = 157, w = 11, h = 16 },
		{ id = "lblCoron", src = 12, x = 139, y = 161, w = 5, h = 12 },
		{ id = "lblRightArrow", src = 12, x = 109, y = 157, w = 11, h = 16 },
		-- stagefile surrogate image
		{ id = "imgStageFileSurrogate", src = 16, x = 0, y = 0, w = -1, h = -1 },
	}
	skin.imageset = {}
	skin.value = {}
	skin.text = {
		-- music title align 1 = centering
		{ id = "title", font = 0, size = 28, align = 1, ref = 12, overflow = 1 },
		-- genre name
		{ id = "genre", font = 0, size = 18, align = 0, ref = 13, overflow = 1 },
		-- artist name
		{ id = "artist", font = 0, size = 18, align = 0, ref = 14, overflow = 1 },
		-- folder name
		{ id = "folder", font = 0, size = 18, align = 0, ref = 1003, overflow = 1 },
	}
	skin.judgegraph = {}
	skin.gaugegraph = {
		{ id = "gaugeGraph" }
	}
	-- base left position
	local basePosSongInfo = 576
	local basePosLeftInfo = 0
	local basePosDiffInfo = 576
	local basePosJudgeInfo = 1142
	local basePosStageFile = 1504
	if isGraphSideRight() then
		basePosSongInfo = 416
		basePosLeftInfo = 1344
		basePosDiffInfo = 416
		basePosJudgeInfo = 982
		basePosStageFile = 0
	end
	-- get left position by base
	local getSongInfoLeft = function(left)
		return left + basePosSongInfo
	end
	local getLeftInfoLeft = function(left)
		return left + basePosLeftInfo
	end
	local getDiffInfoLeft = function(left)
		return left + basePosDiffInfo
	end
	local getJudgeInfoLeft = function(left)
		return left + basePosJudgeInfo
	end
	local getStageFileLeft = function(left)
		return left + basePosStageFile
	end
	-- dst
	skin.destination = {}
	-- background image
	if isBgByRank() then
		insertAll(skin.destination, {
			{ id = "bgFailed", op = { 91 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
			{ id = "bgClear", op = { 90, -300, -301, -302 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
			{ id = "bgA", op = { 90, 302 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
			{ id = "bgAA", op = { 90, 301 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
			{ id = "bgAAA", op = { 90, 300 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
		})
	elseif isBgAll() then
		table.insert(skin.destination, { id = "bgAll", dst = { { x = 0, y = 0, w = 1920, h = 1080 } } })
	else
		insertAll(skin.destination, {
			{ id = "bgFailed", op = { 91 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
			{ id = "bgClear", op = { 90 }, dst = { { x = 0, y = 0, w = 1920, h = 1080 } } },
		})
	end
	-- layer image
	if isLayerByRank() then
		-- loadCustomLayerAnimationScript(skin, ids, ops)
		loadCustomLayerAnimationScript(skin, { "lyFailed", "lyClear", "lyA", "lyAA", "lyAAA" }, {
			{ 91 },
			{ 90, -300, -301, -302 },
			{ 90, 302 },
			{ 90, 301 },
			{ 90, 300 },
		})
	elseif isLayerAll() then
		-- loadCustomLayerAnimationScript(skin, ids, ops)
		loadCustomLayerAnimationScript(skin, { "lyAll" }, { { 0 } })
	else
		-- loadCustomLayerAnimationScript(skin, ids, ops)
		loadCustomLayerAnimationScript(skin, { "lyFailed", "lyClear" }, { { 91 }, { 90 } })
	end
	-- song title
	do
		local dstSongTitleInfo = {
			-- frame
			{ id = -110, dst = { { x = 0, y = 0, w = 1920, h = 40, a = 223 } } },
			-- title text
			{ id = "title", dst = { { x = 1920 / 2, y = 3, w = 1920, h = 28 } } },
		}
		insertAll(skin.destination, dstSongTitleInfo)
	end
	-- song info
	do
		table.insert(skin.image, { id = "lblGenreArtist", src = 12, x = 252, y = 198, w = 90, h = 40 })
		local dstSongInfo = {
			-- frame
			{ id = -110, dst = { { x = getSongInfoLeft(0), y = 40, w = 928, h = 64, a = 127 } } },
			{ id = -110, dst = { { x = getSongInfoLeft(0), y = 48, w = 928, h = 48, a = 191 } } },
			{ id = "lblGenreArtist", dst = { { x = getSongInfoLeft(12), y = 52, w = 90, h = 40 } } },
			{ id = "genre", dst = { { x = getSongInfoLeft(107), y = 73, w = 813, h = 18 } } },
			{ id = "artist", dst = { { x = getSongInfoLeft(107), y = 49, w = 813, h = 18 } } },
		}
		insertAll(skin.destination, dstSongInfo)
	end
	-- left side info
	do
		local dstLeftSideInfo = {
			-- base frame
			{ id = -110, dst = { { x = getLeftInfoLeft(0), y = 40, w = 576, h = 316, a = 127 } } },
			-- graph
			{ id = "gaugeGraph", dst = { { x = getLeftInfoLeft(8), y = 128, w = 560, h = 220 } } },
			-- chart info frame
			{ id = -110, dst = { { x = getLeftInfoLeft(8), y = 104, w = 560, h = 24, a = 127 } } },
			-- play option info frame
			{ id = -110, dst = { { x = getLeftInfoLeft(8), y = 48, w = 560, h = 48, a = 127 } } },
		}
		insertAll(skin.destination, dstLeftSideInfo)
	end
	-- rank
	-- loadCustomRankScript(skin, basePosLeft)
	loadCustomRankScript(skin, basePosLeftInfo)
	-- keys
	do
		local ids = { "5", "7", "10", "14", "9", "24", "48" }
		local ops = { 161, 160, 163, 162, 164, 1160, 1161 }
		for i in ipairs(ids) do
			table.insert(skin.image, { id = "txtKeys"..ids[i], src = 12, x = 0, y = 16 * (i - 1), w = 87, h = 16 })
			table.insert(skin.destination, { id = "txtKeys"..ids[i], op = { ops[i] }, dst = { { x = getLeftInfoLeft(12), y = 108, w = 87, h = 16 } } })
		end
	end
	-- difficulty type
	-- difficulty level
	do
		-- unknown - another
		local ids = { "Unk", "Bgn", "Nom", "Hyp", "Ano" }
		for i in ipairs(ids) do
			table.insert(skin.image, { id = "txtDifficulty"..ids[i], src = 12, x = 87, y = 16 * (i - 1), w = 109, h = 16 })
			table.insert(skin.destination, { id = "txtDifficulty"..ids[i], op = { 150 + (i - 1) }, dst = { { x = getLeftInfoLeft(103), y = 108, w = 109, h = 16 } } })
			if i ~= 1 then
				table.insert(skin.value, { id = "numLv"..ids[i], src = 12, x = 197, y = 16 + 16 * (i - 2), w = 150, h = 16, divx = 10, digit = 2, ref = 45 + (i - 2) })
				table.insert(skin.destination, { id = "numLv"..ids[i], op = { 150 + (i - 1) }, dst = { { x = getLeftInfoLeft(216), y = 108, w = 15, h = 16 } } })
			end
		end
		-- insane
		local srcPosTopInsane = 80
		if useBlackAnother() then
			srcPosTopInsane = 96
		end
		table.insert(skin.image, { id = "txtDifficultyIns", src = 12, x = 87, y = srcPosTopInsane, w = 109, h = 16 })
		table.insert(skin.destination, { id = "txtDifficultyIns", op = { 155 }, dst = { { x = getLeftInfoLeft(103), y = 108, w = 109, h = 16 } } })
		table.insert(skin.value, { id = "numLvIns", src = 12, x = 197, y = srcPosTopInsane, w = 150, h = 16, divx = 10, digit = 2, ref = 49 })
		table.insert(skin.destination, { id = "numLvIns", op = { 155 }, dst = { { x = getLeftInfoLeft(216), y = 108, w = 15, h = 16 } } })
	end
	-- judgerank
	do
		table.insert(skin.image, { id = "lblJudgeRank", src = 12, x = 0, y = 113, w = 65, h = 9 })
		table.insert(skin.destination, { id = "lblJudgeRank", dst = { { x = getLeftInfoLeft(254), y = 108, w = 65, h = 9 } } })
		local ids = { "VH", "HD", "NM", "EZ", "VE" }
		for i in ipairs(ids) do
			table.insert(skin.image, { id = "txtJudgeRank"..ids[i], src = 12, x = 379, y = 174 + 16 * (i - 1), w = 89, h = 16 })
			table.insert(skin.destination, { id = "txtJudgeRank"..ids[i], op = { 180 + (i - 1) }, dst = { { x = getLeftInfoLeft(323), y = 108, w = 89, h = 16 } } })
		end
	end
	-- notes
	do
		table.insert(skin.value, { id = "numNotes", src = 13, x = 0, y = 0, w = 150, h = 16, divx = 10, digit = 5, ref = 74 })
		table.insert(skin.destination, { id = "numNotes", dst = { { x = getLeftInfoLeft(416), y = 108, w = 15, h = 16 } } })
		table.insert(skin.image, { id = "lblNotes", src = 12, x = 0, y = 123, w = 71, h = 16 })
		table.insert(skin.destination, { id = "lblNotes", dst = { { x = getLeftInfoLeft(493), y = 108, w = 71, h = 16 } } })
	end
	-- gauge
	do
		-- gauge type
		table.insert(skin.image, { id = "lblGauge", src = 12, x = 0, y = 140, w = 80, h = 16 })
		table.insert(skin.destination, { id = "lblGauge", dst = { { x = getLeftInfoLeft(26), y = 76, w = 80, h = 16 } } })
		-- TODO at replay, gauge type disps my config
		table.insert(skin.image, { id = "txtGauge", src = 12, x = 469, y = 174, w = 87, h = 144, divy = 9, len = 9, ref = 40 })
		table.insert(skin.destination, { id = "txtGauge", dst = { { x = getLeftInfoLeft(155), y = 76, w = 87, h = 16 } } })
		-- gauge number
		local drawGaugeNum = function()
			local cleared = main_state.option(90)
			local failed = main_state.option(91)
			local isHardGauge = main_state.option(43)
			return cleared or (failed and not isHardGauge)
		end
		table.insert(skin.value, { id = "numGauge", src = 13, x = 0, y = 0, w = 150, h = 16, divx = 10, digit = 3, ref = 107 })
		table.insert(skin.destination, { id = "numGauge", draw = drawGaugeNum, dst = { { x = getLeftInfoLeft(308), y = 76, w = 15, h = 16 } } })
		table.insert(skin.destination, { id = "lblWhitePeriod", draw = drawGaugeNum, dst = { { x = getLeftInfoLeft(353), y = 76, w = 5, h = 4 } } })
		table.insert(skin.value, { id = "numGaugeAfterDot", src = 13, x = 0, y = 0, w = 150, h = 16, divx = 10, digit = 1, ref = 407 })
		table.insert(skin.destination, { id = "numGaugeAfterDot", draw = drawGaugeNum, dst = { { x = getLeftInfoLeft(358), y = 76, w = 15, h = 16 } } })
		table.insert(skin.destination, { id = "lblWhitePercent", draw = drawGaugeNum, dst = { { x = getLeftInfoLeft(374), y = 76, w = 15, h = 16 } } })
		-- dead point (op 91: failed, 43: red gauge)
		table.insert(skin.image, { id = "lblDead", src = 12, x = 109, y = 140, w = 57, h = 16 })
		table.insert(skin.destination, { id = "lblDead", op = { 91, 43 }, dst = { { x = getLeftInfoLeft(320), y = 76, w = 57, h = 16 } } })
		table.insert(skin.image, { id = "lblDeadAt", src = 12, x = 167, y = 147, w = 15, h = 9 })
		table.insert(skin.destination, { id = "lblDeadAt", op = { 91, 43 }, dst = { { x = getLeftInfoLeft(462), y = 76, w = 15, h = 9 } } })
		table.insert(skin.value, { id = "numDeadAt", src = 12, x = 197, y = 96, w = 150, h = 16, divx = 10, digit = 5, value = function()
			return main_state.number(110) + main_state.number(111) + main_state.number(112) + main_state.number(113) + main_state.number(114)
		end })
		table.insert(skin.destination, { id = "numDeadAt", op = { 91, 43 }, dst = { { x = getLeftInfoLeft(485), y = 76, w = 15, h = 16 } } })
	end
	-- option
	do
		-- option
		table.insert(skin.image, { id = "lblOption", src = 12, x = 0, y = 157, w = 90, h = 16 })
		table.insert(skin.destination, { id = "lblOption", dst = { { x = getLeftInfoLeft(16), y = 52, w = 90, h = 16 } } })
		table.insert(skin.image, { id = "txtOption", src = 12, x = 348, y = 0, w = 123, h = 160, divy = 10, len = 10, ref = 42 })
		table.insert(skin.destination, { id = "txtOption", dst = { { x = getLeftInfoLeft(137), y = 52, w = 123, h = 16 } } })
		-- dp only option
		local isDp = main_state.option(162) or main_state.option(163) or main_state.option(1161)
		if isDp then
			table.insert(skin.image, { id = "lblDpLeftArrow", src = 12, x = 94, y = 157, w = 11, h = 16 })
			table.insert(skin.destination, { id = "lblDpLeftArrow", dst = { { x = getLeftInfoLeft(272), y = 52, w = 11, h = 16 } } })
			-- dp option
			table.insert(skin.image, { id = "txtDpOption", src = 12, x = 472, y = 0, w = 115, h = 64, divy = 4, len = 4, ref = 54 })
			table.insert(skin.destination, { id = "txtDpOption", dst = { { x = getLeftInfoLeft(291), y = 52, w = 115, h = 16 } } })
			table.insert(skin.destination, { id = "lblRightArrow", dst = { { x = getLeftInfoLeft(414), y = 52, w = 11, h = 16 } } })
			-- 2p option
			table.insert(skin.image, { id = "txtOption2p", src = 12, x = 348, y = 0, w = 123, h = 160, divy = 10, len = 10, ref = 43 })
			table.insert(skin.destination, { id = "txtOption2p", dst = { { x = getLeftInfoLeft(437), y = 52, w = 123, h = 16 } } })
		end
	end
	-- diff info
	do
		-- base frame
		table.insert(skin.destination, { id = -110, dst = { { x = getDiffInfoLeft(0), y = 104, w = 566, h = 252, a = 127 } } })
		-- strings
		table.insert(skin.image, { id = "lblDiffInfo", src = 12, x = 0, y = 174, w = 166, h = 220 })
		table.insert(skin.destination, { id = "lblDiffInfo", dst = { { x = getDiffInfoLeft(24), y = 128, w = 166, h = 220 } } })
		-- infos
		do
			-- comparison to mybest
			-- local ids = { "ClearType", "Rank", "ScoreRate", "ExScore", "MaxCombo", "MissCount" }
			local posBottom = 332
			for _ = 1, 6, 1 do
				table.insert(skin.destination, { id = "lblRightArrow", dst = { { x = getDiffInfoLeft(329), y = posBottom, w = 11, h = 16 } } })
				posBottom = posBottom - 24
			end
			-- clear type
			table.insert(skin.image, { id = "txtClearTypeMyBest", src = 14, x = 0, y = 0, w = 369, h = 176,
					divx = 3, divy = 11, len = 11, ref = 371, cycle = 120 })
			table.insert(skin.destination, { id = "txtClearTypeMyBest", dst = { { x = getDiffInfoLeft(198), y = 332, w = 123, h = 16 } } })
			--
			table.insert(skin.image, { id = "txtClearTypeNow", src = 14, x = 0, y = 0, w = 369, h = 176,
					divx = 3, divy = 11, len = 11, ref = 370, cycle = 120 })
			table.insert(skin.destination, { id = "txtClearTypeNow", dst = { { x = getDiffInfoLeft(348), y = 332, w = 123, h = 16 } } })
			-- rank
			do
				local ranks = { "AAA", "AA", "A", "B", "C", "D", "E", "F" }
				local srcTopBase = 289
				for i in ipairs(ranks) do
					table.insert(skin.image, { id = "txtRankMyBest"..ranks[i], src = 12, x = 248, y = srcTopBase + (16 * (i - 1)), w = 49, h = 16 })
					table.insert(skin.destination, { id = "txtRankMyBest"..ranks[i], op = { 320 + (i - 1) }, dst = { { x = getDiffInfoLeft(233), y = 308, w = 49, h = 16 } } })
					--
					table.insert(skin.image, { id = "txtRankNow"..ranks[i], src = 12, x = 248, y = srcTopBase + (16 * (i - 1)), w = 49, h = 16 })
					table.insert(skin.destination, { id = "txtRankNow"..ranks[i], op = { 300 + (i - 1) }, dst = { { x = getDiffInfoLeft(383), y = 308, w = 49, h = 16 } } })
				end
			end
			-- score rate
			do
				-- my best
				local scoreRateMyBest = main_state.number(183)
				local posLeftScoreRateMyBest = getDiffInfoLeft(219)
				local posLeftPeriodScoreRateMyBest = getDiffInfoLeft(264)
				local posLeftScoreRateMyBestAfterDot = getDiffInfoLeft(269)
				if scoreRateMyBest ~= 100 then
					posLeftScoreRateMyBest = posLeftScoreRateMyBest - 7
					posLeftPeriodScoreRateMyBest = posLeftPeriodScoreRateMyBest - 7
					posLeftScoreRateMyBestAfterDot = posLeftScoreRateMyBestAfterDot - 7
				end
				table.insert(skin.value, { id = "numScoreRateMyBest", src = 13, x = 0, y = 16, w = 150, h = 16, divx = 10, digit = 3, ref = 183 })
				table.insert(skin.destination, { id = "numScoreRateMyBest", dst = { { x = posLeftScoreRateMyBest, y = 284, w = 15, h = 16 } } })
				table.insert(skin.image, { id = "lblPeriodScoreRateMyBest", src = 12, x = 103, y = 135, w = 5, h = 4 })
				table.insert(skin.destination, { id = "lblPeriodScoreRateMyBest", dst = { { x = posLeftPeriodScoreRateMyBest, y = 284, w = 5, h = 4 } } })
				table.insert(skin.value, { id = "numScoreRateMyBestAfterDot", src = 13, x = 0, y = 16, w = 150, h = 16, divx = 10, digit = 2, padding = 1,  ref = 184 })
				table.insert(skin.destination, { id = "numScoreRateMyBestAfterDot", dst = { { x = posLeftScoreRateMyBestAfterDot, y = 284, w = 15, h = 16 } } })
			end
			do
				-- now
				local scoreRateNow = main_state.number(102)
				local posLeftScoreRateNow = getDiffInfoLeft(369)
				local posLeftPeriodScoreRateNow= getDiffInfoLeft(414)
				local posLeftScoreRateNowAfterDot= getDiffInfoLeft(419)
				if scoreRateNow ~= 100 then
					posLeftScoreRateNow = posLeftScoreRateNow - 7
					posLeftPeriodScoreRateNow = posLeftPeriodScoreRateNow - 7
					posLeftScoreRateNowAfterDot = posLeftScoreRateNowAfterDot - 7
				end
				table.insert(skin.value, { id = "numScoreRateNow", src = 13, x = 0, y = 16, w = 150, h = 16, divx = 10, digit = 3, ref = 102 })
				table.insert(skin.destination, { id = "numScoreRateNow", dst = { { x = posLeftScoreRateNow, y = 284, w = 15, h = 16 } } })
				table.insert(skin.image, { id = "lblPeriodScoreRateNow", src = 12, x = 103, y = 135, w = 5, h = 4 })
				table.insert(skin.destination, { id = "lblPeriodScoreRateNow", dst = { { x = posLeftPeriodScoreRateNow, y = 284, w = 5, h = 4 } } })
				table.insert(skin.value, { id = "numScoreRateNowAfterDot", src = 13, x = 0, y = 16, w = 150, h = 16, divx = 10, digit = 2, padding = 1, ref = 103 })
				table.insert(skin.destination, { id = "numScoreRateNowAfterDot", dst = { { x = posLeftScoreRateNowAfterDot, y = 284, w = 15, h = 16 } } })
			end
			-- ex score
			table.insert(skin.value, { id = "numExScoreMyBest", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 170 })
			table.insert(skin.destination, { id = "numExScoreMyBest", dst = { { x = getDiffInfoLeft(230), y = 260, w = 15, h = 16 } } })
			--
			table.insert(skin.value, { id = "numExScoreNow", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 171 })
			table.insert(skin.destination, { id = "numExScoreNow", dst = { { x = getDiffInfoLeft(380), y = 260, w = 15, h = 16 } } })
			--
			table.insert(skin.value, { id = "numExScoreDiff", src = 13, x = 0, y = 64, w = 192, h = 9, divx = 24, digit = 5, padding = 1, zeropadding = 1, ref = 172 })
			table.insert(skin.destination, { id = "numExScoreDiff", dst = { { x = getDiffInfoLeft(479), y = 263, w = 8, h = 9 } } })
			-- max combo
			table.insert(skin.value, { id = "numMaxComboMyBest", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 173 })
			table.insert(skin.destination, { id = "numMaxComboMyBest", dst = { { x = getDiffInfoLeft(230), y = 236, w = 15, h = 16 } } })
			--
			table.insert(skin.value, { id = "numMaxComboNow", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 105 })
			table.insert(skin.destination, { id = "numMaxComboNow", dst = { { x = getDiffInfoLeft(380), y = 236, w = 15, h = 16 } } })
			--
			table.insert(skin.value, { id = "numMaxComboDiff", src = 13, x = 0, y = 64, w = 192, h = 9, divx = 24, digit = 5, padding = 1, zeropadding = 1, ref = 175 })
			table.insert(skin.destination, { id = "numMaxComboDiff", dst = { { x = getDiffInfoLeft(479), y = 239, w = 8, h = 9 } } })
			-- miss count
			table.insert(skin.value, { id = "numMissCountMyBest", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 176 })
			table.insert(skin.destination, { id = "numMissCountMyBest", dst = { { x = getDiffInfoLeft(230), y = 212, w = 15, h = 16 } } })
			--
			table.insert(skin.value, { id = "numMissCountNow", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 177 })
			table.insert(skin.destination, { id = "numMissCountNow", dst = { { x = getDiffInfoLeft(380), y = 212, w = 15, h = 16 } } })
			--
			local missCountDiff = main_state.number(178)
			local srcPosTop = 73
			if missCountDiff == 0 then
				-- when diff is 0, use white number
				srcPosTop = 64
			end
			table.insert(skin.value, {
				id = "numMissCountDiff", src = 13, x = 0, y = srcPosTop, w = 192, h = 9,
				divx = 24, digit = 5, padding = 1, zeropadding = 1, ref = 178
			})
			table.insert(skin.destination, { id = "numMissCountDiff", dst = { { x = getDiffInfoLeft(479), y = 215, w = 8, h = 9 } } })
			-- target score
			table.insert(skin.value, { id = "numTargetScore", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = 151 })
			table.insert(skin.destination, { id = "numTargetScore", dst = { { x = getDiffInfoLeft(380), y = 180, w = 15, h = 16 } } })
			--
			table.insert(skin.value, { id = "numTargetScoreDiff", src = 13, x = 0, y = 64, w = 192, h = 9, divx = 24, digit = 5, padding = 1, zeropadding = 1, ref = 153 })
			table.insert(skin.destination, { id = "numTargetScoreDiff", dst = { { x = getDiffInfoLeft(479), y = 183, w = 8, h = 9 } } })
			-- next rank
			do
				local ranks = { "MAX", "AAA", "AA", "A", "B", "C", "D", "E", "F" }
				local srcTopBase = 273
				for i in ipairs(ranks) do
					table.insert(skin.image, { id = "txtNextRank"..ranks[i], src = 12, x = 248, y = srcTopBase + (16 * (i - 1)), w = 49, h = 16 })
					table.insert(skin.destination, { id = "txtNextRank"..ranks[i], op = { 300 + (i - 1) }, dst = { { x = getDiffInfoLeft(383), y = 156, w = 49, h = 16 } } })
				end
			end
			--
			local nextRankDiff = main_state.number(154)
			local srcPosTopNextRankDiff = 82
			if nextRankDiff == 0 then
				-- when diff is 0, use white number
				srcPosTopNextRankDiff = 64
			end
			table.insert(skin.value, {
				id = "numNextRankDiff", src = 13, x = 0, y = srcPosTopNextRankDiff, w = 192, h = 9,
				divx = 24, digit = 5, padding = 1, zeropadding = 1, ref = 154
			})
			table.insert(skin.destination, { id = "numNextRankDiff", dst = { { x = getDiffInfoLeft(479), y = 159, w = 8, h = 9 } } })
			-- ir
			if main_state.option(51) then
				-- ir disabled (when replay, ir is online and donot begin connecting)
				table.insert(skin.image, { id = "txtIrDisabled", src = 12, x = 0, y = 443, w = 109, h = 16 })
				table.insert(skin.destination, { id = "txtIrDisabled",
					draw = function()
						return main_state.timer(172) == main_state.timer_off_value
					end, dst = { { x = getDiffInfoLeft(280), y = 128, w = 109, h = 16 } } })
				-- ir connecting
				table.insert(skin.image, { id = "txtIrConnecting", src = 12, x = 0, y = 427, w = 149, h = 16 })
				table.insert(skin.destination, { id = "txtIrConnecting",
					draw = function()
						local begin = main_state.timer(172) ~= main_state.timer_off_value
						local succeed = main_state.timer(173) ~= main_state.timer_off_value
						local failed = main_state.timer(174) ~= main_state.timer_off_value
						return begin and (not succeed and not failed)
					end, dst = {
						{ time = 0, x = getDiffInfoLeft(263), y = 128, w = 149, h = 16, a = 255 },
						{ time = 2000, a = 255 },
						{ time = 3000, a = 0 },
						{ time = 4000, a = 255 },
					}
				})
				-- ir rank
				table.insert(skin.value, { id = "numIrBest", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 5, ref = 182 })
				table.insert(skin.destination, { id = "numIrBest", timer = 173, dst = { { x = getDiffInfoLeft(223), y = 128, w = 15, h = 16 } } })
				table.insert(skin.destination, { id = "lblRightArrow", timer = 173, dst = { { x = getDiffInfoLeft(329), y = 128, w = 11, h = 16 } } })
				table.insert(skin.value, { id = "numIrNow", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 5, ref = 179 })
				table.insert(skin.destination, { id = "numIrNow", timer = 173, dst = { { x = getDiffInfoLeft(373), y = 128, w = 15, h = 16 } } })
				table.insert(skin.destination, { id = "lblThrash", timer = 173, dst = { { x = getDiffInfoLeft(456), y = 128, w = 11, h = 16 } } })
				table.insert(skin.value, { id = "numIrTotal", src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 5, ref = 180 })
				table.insert(skin.destination, { id = "numIrTotal", timer = 173, dst = { { x = getDiffInfoLeft(475), y = 128, w = 15, h = 16 } } })
				-- ir failed
				table.insert(skin.image, { id = "txtIrFailed", src = 12, x = 0, y = 411, w = 95, h = 16 })
				table.insert(skin.destination, { id = "txtIrFailed", timer = 174, dst = { { x = getDiffInfoLeft(287), y = 128, w = 95, h = 16 } } })
			else
				-- ir offline
				table.insert(skin.image, { id = "txtIrOffline", src = 12, x = 0, y = 395, w = 95, h = 16 })
				table.insert(skin.destination, { id = "txtIrOffline", dst = { { x = getDiffInfoLeft(287), y = 128, w = 95, h = 16 } } })
			end
		end
	end
	-- judge detail info
	do
		-- base frame
		table.insert(skin.destination, { id = -110, dst = { { x = getJudgeInfoLeft(0), y = 104, w = 362, h = 252, a = 127 } } })
		-- strings
		table.insert(skin.image, { id = "lblJudgeDetailInfo", src = 12, x = 167, y = 198, w = 80, h = 112 })
		table.insert(skin.destination, { id = "lblJudgeDetailInfo", dst = { { x = getJudgeInfoLeft(8), y = 188, w = 80, h = 112 } } })
		-- pg
		table.insert(skin.image, { id = "lblPGreat", src = 12, x = 167, y = 383, w = 80, h = 48, divy = 3, cycle = 120 })
		table.insert(skin.destination, { id = "lblPGreat", dst = { { x = getJudgeInfoLeft(8), y = 308, w = 80, h = 16 } } })
		-- f/s or e/l string
		if useEarlyLate() then
			-- total label
			table.insert(skin.image, { id = "lblEarlyLate", src = 12, x = 199, y = 342, w = 48, h = 16 })
			table.insert(skin.destination, { id = "lblEarlyLate", dst = { { x = getJudgeInfoLeft(40), y = 164, w = 48, h = 16 } } })
			-- column header
			table.insert(skin.image, { id = "lblEarly", src = 12, x = 248, y = 256, w = 68, h = 16 })
			table.insert(skin.destination, { id = "lblEarly", dst = { { x = getJudgeInfoLeft(187), y = 332, w = 68, h = 16 } } })
			table.insert(skin.image, { id = "lblLate", src = 12, x = 317, y = 256, w = 61, h = 16 })
			table.insert(skin.destination, { id = "lblLate", dst = { { x = getJudgeInfoLeft(277), y = 332, w = 61, h = 16 } } })
		else
			-- total label
			table.insert(skin.image, { id = "lblFastSlow", src = 12, x = 199, y = 318, w = 48, h = 16 })
			table.insert(skin.destination, { id = "lblFastSlow", dst = { { x = getJudgeInfoLeft(40), y = 164, w = 48, h = 16 } } })
			-- column header
			table.insert(skin.image, { id = "lblFast", src = 12, x = 248, y = 239, w = 68, h = 16 })
			table.insert(skin.destination, { id = "lblFast", dst = { { x = getJudgeInfoLeft(187), y = 332, w = 68, h = 16 } } })
			table.insert(skin.image, { id = "lblSlow", src = 12, x = 317, y = 239, w = 61, h = 16 })
			table.insert(skin.destination, { id = "lblSlow", dst = { { x = getJudgeInfoLeft(277), y = 332, w = 61, h = 16 } } })
		end
		-- cbrk
		table.insert(skin.image, { id = "lblCbrk", src = 12, x = 181, y = 366, w = 66, h = 16 })
		table.insert(skin.destination, { id = "lblCbrk", dst = { { x = getJudgeInfoLeft(22), y = 140, w = 66, h = 16 } } })
		do
			local ids = { "PG", "GR", "GD", "BD", "PR", "MS", "FS", "CBRK" }
			local refs = { 110, 111, 112, 113, 114, 420, -1, 425 }
			local refsFast = { 410, 412, 414, 416, 418, 421, 423, -1 }
			local refsSlow = { 411, 413, 415, 417, 419, 422, 424, -1 }
			local lefts = { getJudgeInfoLeft(104), getJudgeInfoLeft(172), getJudgeInfoLeft(191), getJudgeInfoLeft(259), getJudgeInfoLeft(278) }
			local numFastTop
			local numSlowTop
			if useEarlyLate() then
				numFastTop = 32
				numSlowTop = 48
			else
				numFastTop = 48
				numSlowTop = 32
			end
			local bottom = 308
				for i in ipairs(ids) do
				if refs[i] ~= -1 then
					table.insert(skin.value, {
						id = "numJudgeDetail"..ids[i], src = 13, x = 0, y = 16, w = 166, h = 16, divx = 11, digit = 4, ref = refs[i] })
					table.insert(skin.destination, {
						id = "numJudgeDetail"..ids[i], dst = { { x = lefts[1], y = bottom, w = 15, h = 16 } } })
					if refsFast[i] ~= -1 then
						table.insert(skin.destination, { id = "lblThrash", dst = { { x = lefts[2], y = bottom, w = 11, h = 16 } } })
					end
				end
				if refsFast[i] ~= -1 then
					table.insert(skin.value, {
						id = "numJudgeDetailFast"..ids[i], src = 13, x = 0, y = numFastTop, w = 166, h = 16, divx = 11, digit = 4, ref = refsFast[i] })
					table.insert(skin.destination, {
						id = "numJudgeDetailFast"..ids[i], dst = { { x = lefts[3], y = bottom, w = 15, h = 16 } } })
					table.insert(skin.destination, { id = "lblThrash", dst = { { x = lefts[4], y = bottom, w = 11, h = 16 } } })
				end
				if refsSlow[i] ~= -1 then
					table.insert(skin.value, {
						id = "numJudgeDetailSlow"..ids[i], src = 13, x = 0, y = numSlowTop, w = 166, h = 16, divx = 11, digit = 4, ref = refsSlow[i] })
					table.insert(skin.destination, {
						id = "numJudgeDetailSlow"..ids[i], dst = { { x = lefts[5], y = bottom, w = 15, h = 16 } } })
				end
				bottom = bottom - 24
			end
		end
	end
	-- stagefile
	do
		-- base frame
		table.insert(skin.destination, { id = -110, dst = { { x = getStageFileLeft(0), y = 40, w = 416, h = 316, a = 127 } } })
		table.insert(skin.destination, { id = "imgStageFileSurrogate", dst = { { x = getStageFileLeft(8), y = 48, w = 400, h = 300 } } })
		-- stage file
		table.insert(skin.destination, { id = -100, dst = { { x = getStageFileLeft(8), y = 48, w = 400, h = 300 } } })
	end
	-- folder info
	if main_state.option(1008) then
		-- base frame
		table.insert(skin.destination, { id = -110, dst = { { x = getSongInfoLeft(0), y = 96, w = 928, h = 24, a = 191 } } })
		-- label
		table.insert(skin.image, { id = "lblFolder", src = 12, x = 248, y = 174, w = 94, h = 16 })
		table.insert(skin.destination, { id = "lblFolder", dst = { { x = getSongInfoLeft(8), y = 100, w = 94, h = 16 } } })
		-- value
		table.insert(skin.destination, { id = "folder", dst = { { x = getSongInfoLeft(107), y = 97, w = 813, h = 18 } } })
	end
	-- time
	if isShowCurrentTime() then
		local posLeftYear
		local posLeftYearThrash
		local posLeftMonth
		local posLeftMonthThrash
		local posLeftDay
		if isShowDateAndTime() then
			posLeftYear = 832
			posLeftYearThrash = 893
			posLeftMonth = 905
			posLeftMonthThrash = 936
			posLeftDay = 948
		else
			posLeftYear = 887
			posLeftYearThrash = 948
			posLeftMonth = 960
			posLeftMonthThrash = 991
			posLeftDay = 1003
		end
		-- year
		table.insert(skin.value, { id = "numYear", src = 13, x = 0, y = 0, w = 165, h = 16, divx = 11, digit = 4, ref = 21 })
		table.insert(skin.destination, { id = "numYear", dst = { { x = posLeftYear, y = 360, w = 15, h = 16 } } })
		table.insert(skin.destination, { id = "lblThrash", dst = { { x = posLeftYearThrash, y = 360, w = 11, h = 16 } } })
		-- month
		table.insert(skin.value, { id = "numMonth", src = 13, x = 0, y = 0, w = 165, h = 16, divx = 11, digit = 2, ref = 22 })
		table.insert(skin.destination, { id = "numMonth", dst = { { x = posLeftMonth, y = 360, w = 15, h = 16 } } })
		table.insert(skin.destination, { id = "lblThrash", dst = { { x = posLeftMonthThrash, y = 360, w = 11, h = 16 } } })
		-- day
		table.insert(skin.value, { id = "numDay", src = 13, x = 0, y = 0, w = 165, h = 16, divx = 11, digit = 2, ref = 23 })
		table.insert(skin.destination, { id = "numDay", dst = { { x = posLeftDay, y = 360, w = 15, h = 16 } } })
		if isShowDateAndTime() then
			-- hour
			table.insert(skin.value, { id = "numHour", src = 13, x = 0, y = 0, w = 165, h = 16, divx = 11, digit = 2, ref = 24 })
			table.insert(skin.destination, { id = "numHour", dst = { { x = 984, y = 360, w = 15, h = 16 } } })
			table.insert(skin.destination, { id = "lblCoron", dst = { { x = 1015, y = 360, w = 5, h = 12 } } })
			-- minute
			table.insert(skin.value, { id = "numMinute", src = 13, x = 0, y = 0, w = 165, h = 16, divx = 11, digit = 2, ref = 25 })
			table.insert(skin.destination, { id = "numMinute", dst = { { x = 1021, y = 360, w = 15, h = 16 } } })
			table.insert(skin.destination, { id = "lblCoron", dst = { { x = 1052, y = 360, w = 5, h = 12 } } })
			-- second
			table.insert(skin.value, { id = "numSecond", src = 13, x = 0, y = 0, w = 165, h = 16, divx = 11, digit = 2, ref = 26 })
			table.insert(skin.destination, { id = "numSecond", dst = { { x = 1058, y = 360, w = 15, h = 16 } } })
		end
	end
	-- opening animation
	-- basic fade in
	table.insert(skin.destination, {
		id = -110, blend = 1, loop = 250, dst = {
			{ time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 255 },
			{ time = 250, a = 0 },
		}
	})
	-- ending animation
	loadCustomEndingAnimationScript(skin)

	return skin
end

return {
	header = header,
	main = main
}
