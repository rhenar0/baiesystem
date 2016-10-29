AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel("models/props_junk/garbage_coffeemug001a.mdl")
	self:SetModelScale(self:GetModelScale() * 5, 1)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	local phys = self.Entity:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use( activator )

	local speeddefault = activator:GetRunSpeed()
	local rd = math.random(5,20)

	activator:SetRunSpeed(speeddefault + rd)

	timer.Create("ResetSpeedDefault",20,1,function()
		activator:SetRunSpeed(speeddefault)
	end)

	activator:Say("/me prend la baie et l'englouti")

	activator:EmitSound( "nourriture/eating.wav", 50, 100 )

 	activator:ChatPrint("Vous avez termine la "..self.PrintName..".")
		self:Remove()

end
