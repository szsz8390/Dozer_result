--- Dozer - RESULT "NOT" SIMPLE FM Custom ending animation.
-- Dozer's custom ending animation definition script.
-- @author Suzu Yuuki
-- @release 1.2.0

--- カスタマイズされた終了アニメーションを定義します。
local function load()
	local parts = {}
	parts.destination = {}
	
	-- basic fade out
	table.insert(parts.destination, {
		id = -110, blend = 1, loop = 500, timer = 2, dst = {
			{ time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0 },
			{ time = 500, a = 255 },
		}
	})

	return parts
end

return {
	load = load
}
