AddCSLuaFile()
ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.PrintName = "Stocks Book"
ENT.Author = "Leonheart#7476"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
    function ENT:Initialize()
        self:SetModel("models/props_lab/binderredlabel.mdl")
        self:SetSolid(SOLID_VPHYSICS)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        local physObj = self:GetPhysicsObject()

        if IsValid(physObj) then
            physObj:Wake()
        end
    end

    function ENT:OnTakeDamage()
        return false
    end

    function ENT:AcceptInput(Name, Activator, Caller)
        if Name == "Use" and Caller:IsPlayer() then
            net.Start("stocks_menu_popup")
            net.Send(Caller)
        end
    end
else
    function ENT:Draw()
        self:DrawModel()
    end

    ENT.DrawEntityInfo = true
    local toScreen = FindMetaTable("Vector").ToScreen
    local colorAlpha = ColorAlpha
    local drawText = nut.util.drawText
    local configGet = nut.config.get

    function ENT:onDrawEntityInfo(alpha)
        local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
        local x, y = position.x, position.y
        local tx, ty = drawText(self.Name or self.PrintName, x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
        drawText("A book that displays all stocks available to be bought.", x, y + 16, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
    end
end