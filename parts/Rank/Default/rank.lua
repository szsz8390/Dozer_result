--- Dozer - RESULT "NOT" SIMPLE FM Custom Rank parts.
-- Dozer's custom Rank parts definition script.
-- @author Suzu Yuuki
-- @release 1.0.0

--- カスタマイズされたランク表示を定義します.
-- @param srcId Source 定義に使用する id
-- @param basePosLeftInfo デフォルトの左オフセットです。グラフサイドにより変化します。
--                        グラフサイド 左: 0 右: 1344
local function load(srcId, basePosLeftInfo)
	local parts = {}
	parts.image = {}
	parts.destination = {}
	
	local getLeftInfoLeft = function(left)
		return left + basePosLeftInfo
	end
	local ids = { "AAA", "AA", "A", "B", "C", "D", "E", "F" }
	local srcLeftPoss = { 0, 0, 0, 213, 284, 355, 426, 497 }
	local widths = { 212, 141, 70, 70, 70, 70, 70, 70 }
	for i in ipairs(ids) do
		table.insert(parts.image, { id = "imgBigRank"..ids[i], src = srcId, x = srcLeftPoss[i], y = 0, w = widths[i], h = 74 })
		table.insert(parts.destination, {
			id = "imgBigRank"..ids[i], op = { 300 + (i - 1) },
			dst = { { x = getLeftInfoLeft(16), y = 135, w = widths[i], h = 74 } }
		})
	end

	return parts
end

return {
	load = load
}
