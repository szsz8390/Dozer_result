--- Dozer - RESULT "NOT" SIMPLE FM Custom ending animation.
-- Dozer's custom ending animation definition script.
-- @author Suzu Yuuki
-- @release 1.2.0

--- カスタマイズされた終了アニメーションを定義します。
local function load()
	local parts = {}
	parts.source = {}
	parts.image = {}
	parts.destination = {}

	-- ModernChic shutter closing
	table.insert(parts.source, { id = 99, path = "../ModernChic/Select/parts/jp/mainframe.png" })
	table.insert(parts.image, { id = "shutter-l", src = 99, x = 0, y = 0, w = 1004, h = 1080 })
	table.insert(parts.image, { id = "shutter-r", src = 99, x = 1020, y = 0, w = 1003, h = 1080 })

	table.insert(parts.destination, {
		id = -110, blend = 1, loop = 1000, timer = 2, dst = {
			{ time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0 },
			{ time = 999, x = 0, y = 0, w = 1920, h = 1080, a = 0 },
			{ time = 1000, a = 255 },
		}
	})
	table.insert(parts.destination, {
		id = "shutter-l", loop = 1000, timer = 2, dst = {
			{ time = 0, x = -1004, y = 0, w = 1004, h = 1080, acc = 2 },
			{ time = 800 },
			{ time = 1000, x = 0 }
		}
	})
	table.insert(parts.destination, {
		id = "shutter-r", loop = 1000, timer = 2, dst = {
			{ time = 0, x = 1919, y = 0, w = 1003, h = 1080, acc = 2 },
			{ time = 800 },
			{ time = 1000, x = 915 }
		}
	})

	return parts
end

return {
	load = load
}
