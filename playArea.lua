--[[

This is the fourth in the series of objects where I take all the functions of 
my promote board and put them into smaller objects so that people won't complain
about having too many functions on one object, and so that people can only save
the ones that they use.

Current object: play area
promote board: https://steamcommunity.com/sharedfiles/filedetails/?id=1459817693
Made by: l55tremine

]]--

parameters = {
	click_function="nilFunction", 
	function_owner=self,
	rotation={0,0,0},
	height=0, 
	width=0,
	font_size = 250,
	scale = {0.2,0,0.33},
	font_color = stringColorToRGB("White")
}

function onLoad()
	-- Title
	parameters.label="Play Area Set" --Admin Chat
	parameters.position={-0.19, 0.5, -0.38}
	self.createButton(parameters)
	
	parameters.label="Used to set the boundries of the world.\nYou can also use !pa and then a number to set\nit to a specific number"
	parameters.position={-0.17, 0.5, -0.2}
	parameters.font_size = 75
	self.createButton(parameters)
	
	parameters.height = 300
	parameters.width = 600
	parameters.font_size = 200
	
	local xStart = -0.3
	local xInc = 0.3
	local yStart = 0.05
	local yInc = 0.25
	
	local runX = xStart
	local runY = yStart
	
	parameters.font_color = stringColorToRGB("Black")
	
	Player["Blue"].broadcast(runX..", "..runY)
	
	parameters.label = "0.1"
	parameters.position = {runX, 0.5, runY}
	parameters.click_function = "set01"
	self.createButton(parameters)
	runX = runX + xInc
	
	parameters.label = "0.5"
	parameters.position = {runX, 0.5, runY}
	parameters.click_function = "set05"
	self.createButton(parameters)
	runX = runX + xInc
	
	parameters.label = "1"
	parameters.position = {runX, 0.5, runY}
	parameters.click_function = "set1"
	self.createButton(parameters)
	runX = xStart
	runY = yStart + yInc
	
	parameters.label = "1.5"
	parameters.position = {runX, 0.5, runY}
	parameters.click_function = "set15"
	self.createButton(parameters)
	runX = runX + xInc
	
	parameters.label = "2"
	parameters.position = {runX, 0.5, runY}
	parameters.click_function = "set2"
	self.createButton(parameters)
	runX = runX + xInc
	
	parameters.label = "100"
	parameters.position = {runX, 0.5, runY}
	parameters.click_function = "set100"
	self.createButton(parameters)
	runX = runX + xInc
	
end

function onChat(message, theChatter)
	if (theChatter.admin) then
		local args = {} -- The arguments following a command
		local command = nil -- The command. "move" etc
		for i in string.gmatch(message, "%S+") do
			if(command == nil) then
				command = string.lower(i)
			else
				args[#args + 1] = i
			end
		end
		
		if (command == "!pa" and #args == 1) then
			Physics.play_area = args[1]
			
			return false
		end
		
	end
end

function nilFunction()
	return false
end

function playAreaSet(color, playArea)
	if Player[color].admin == true then
		Physics.play_area = playArea
	end
end

function set01(o, color)
	playAreaSet(color,0.1)
end
function set05(o, color)
	playAreaSet(color,0.5)
end
function set1(o, color)
	playAreaSet(color,1)
end
function set15(o, color)
	playAreaSet(color,1.5)
end
function set2(o, color)
	playAreaSet(color,2)
end
function set100(o, color)
	playAreaSet(color,100)
end

--[[

object specs: square tinted to 151515 and size of {5.00, 0.03, 3.00}

]]--







