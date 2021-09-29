--- Dozer - RESULT "NOT" SIMPLE FM Custom Layer animation.
-- Dozer's custom Layer animation definition script.
-- @author Suzu Yuuki
-- @release 1.0.0

--- カスタマイズされたレイヤアニメーションを定義します。
-- @param ids destination に設定する id のリスト
-- @param ops destination に設定する op のリスト
local function load(ids, ops)
	local parts = {}
	parts.destination = {}
	for i, v in ipairs(ids) do
		table.insert(parts.destination, {
			id = ids[i], op = ops[i], loop = 3000, center = 5,
			dst = {
				{ time = 0, acc = 0, x = 0, y = 0, w = 0, h = 0, angle = 0 },
				{ time = 100, angle = 360, x = 864, y = 486, w = 192, h = 108 },
				{ time = 200, angle = 0, x = 768, y = 432, w = 384, h = 216 },
				{ time = 300, angle = 360, x = 672, y = 378, w = 576, h = 324 },
				{ time = 400, angle = 0, x = 576, y = 324, w = 768, h = 432 },
				{ time = 500, angle = 360, x = 480, y = 270, w = 960, h = 540 },
				{ time = 600, angle = 0, x = 384, y = 216, w = 1152, h = 648 },
				{ time = 700, angle = 360, x = 288, y = 162, w = 1344, h = 756 },
				{ time = 800, angle = 0, x = 192, y = 108, w = 1536, h = 864 },
				{ time = 900, angle = 360, x = 96, y = 54, w = 1728, h = 972 },
				{ time = 1000, angle = 0, x = 0, y = 0, w = 1920, h = 1080 },
				{ time = 2000, angle = 0 },
				{ time = 3000, y = -1080 },
			}
		})
	end
	
	return parts
end

return {
	load = load
}
