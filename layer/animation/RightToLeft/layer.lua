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
			id = ids[i], op = ops[i], loop = 1000,
			dst = {
				{ time = 0, acc = 2, x = 120, y = 0, w = 1920, h = 1080 },
				{ time = 1000, x = 0 },
			}
		})
	end
	
	return parts
end

return {
	load = load
}
