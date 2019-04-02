main()
----------------------------------------
-- get all info about inventory
--
-- funtion: get item detail for all items
-- return: array of itemDetail()
--
function getInventoryDetail()
	local data = {}
	for i = 1,16 do
		turtle.select(i)
		data[i] = turtle.getItemDetail()
	end
	return data
end

function main()
	local inv = getInventoryDetail()

	--print(textutils.serialize(inv[1]))
	--print(textutils.serialize(inv[2]))
	--print(math.floor(5/3))
	--print(inv[1]["name"])
	--print(inv[2]["name"])

	local burncount = 0
	local canburn = true;
	for i, v in pairs(inv) do
		--print(textutils.serialize(v))
		if canburn and v["name"] == "minecraft:cobblestone" then
			burncount = v["count"] - (v["count"]%8)
			if(burncount > 0) then
				canburn = false
			end
			turtle.select(i)
			turtle.drop(burncount)
			burncount = burncount / 8
		end
		if v["name"] == "minecraft:coal" then
			turtle.select(i)
			local a = burncount - v["count"]
			turtle.drop(burncount)
			if a <= 0 then
				break
			end
			burncount = burncount - a
		end
	end
end
