AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel("models/maizepokemon/berries/oran.mdl")
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

	local plyhealth = activator:Health()

	local math.random(10,100)

	activator:SetHealth(plyhealth + rd)

	activator:Say("/me prend la baie et l'englouti")

	activator:EmitSound( "nourriture/snd_jack_eat1.wav", 50, 100 )

	activator:ChatPrint("Vous avez termine la"..self.PrintName..".")
	self:Remove()

end
