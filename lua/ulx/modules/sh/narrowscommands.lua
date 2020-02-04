local CATEGORY_NAME = "Narrow's Commands"

function ulx.killrich()
	for k, v in pairs(player.GetAll()) do
		if (v:Health() > 99) then
			v:Kill()
		end
	end 
end

local killrich = ulx.command( CATEGORY_NAME, "ulx killrich", ulx.killrich, "!killrich", true )
--killrich:addParam{ type=ULib.cmds.PlayerArg }
killrich:defaultAccess( ULib.ACCESS_ADMIN )
killrich:help( "Kills all players above 99HP." )

function ulx.slowdown()
	for k, p in pairs(player.GetAll()) do
		if (p:IsSprinting()) then
			p:Kill()
		end
	end
end

local slowdown = ulx.command(CATEGORY_NAME, "ulx slowdown", ulx.slowdown, "!slowdown", true)
slowdown:defaultAccess(ULib.ACCESS_ADMIN)
slowdown:help("Kills all players who are sporinting.")

function ulx.doors()
	mapName = game.GetMap()
	if (mapName == "jb_new_summer_v2") then
		for d = 1, 16, 1 do 
			ents.FindByName("cells")[d]:Fire("toggle", 0)
		end
	end
	elseif (mapName = "ba_jail_blackops") then
		for d = 1, 13, 1 do
			ents.FindByName("prisondoor")[d]:Fire("Toggle", 0)
		end
	end
end

local doors = ulx.command(CATEGORY_NAME, "ulx doors", ulx.doors, "!doors", true)
doors:defaultAccess(ULib.ACCESS_ADMIN)
doors:help("Toggles the cell doors.")
