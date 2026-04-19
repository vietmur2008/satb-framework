local ArrowSystem = {}
ArrowSystem.__index = ArrowSystem

function ArrowSystem.new()
	local self = setmetatable({}, ArrowSystem)
	self.arrows = {}
	self.arrowSpeed = 100
	self.arrowLifetime = 10
	return self
end

function ArrowSystem:initialize()
	print("Arrow System initialized")
end

function ArrowSystem:fireArrow(player, targetPosition)
	local character = player.Character
	if not character then return end
	
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then return end
	
	local arrow = Instance.new("Part")
	arrow.Name = "Arrow"
	arrow.Shape = Enum.PartType.Cylinder
	arrow.Size = Vector3.new(0.2, 0.2, 2)
	arrow.Color = Color3.fromRGB(139, 69, 19)
	arrow.CanCollide = true
	arrow.CFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.LookVector * 5
	arrow.TopSurface = Enum.SurfaceType.Smooth
	arrow.BottomSurface = Enum.SurfaceType.Smooth
	
	local bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.Velocity = (targetPosition - arrow.Position).Unit * self.arrowSpeed
	bodyVelocity.Parent = arrow
	
	arrow.Parent = workspace
	
	table.insert(self.arrows, arrow)
	
	game:GetService("Debris"):AddItem(arrow, self.arrowLifetime)
	
	return arrow
end

function ArrowSystem:createArrow(player, targetPosition)
	return self:fireArrow(player, targetPosition)
end

return ArrowSystem
