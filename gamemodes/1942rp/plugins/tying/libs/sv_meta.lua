local playerMeta = FindMetaTable("Player")

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function playerMeta:SetVehicleAllowed()
    if self:getNetVar("vehicle_allowed") then
        self:setNetVar("vehicle_allowed", false)
    else
        self:setNetVar("vehicle_allowed", true)
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function playerMeta:FreeTies()
    self:setNetVar("vehicle_allowed", false)
    self:setNetVar("blinded", false)
    self:setNetVar("dragged", false)
    self:setNetVar("gagged", false)
    self:setNetVar("restricted", false)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function playerMeta:SetBlinded()
    if self:getNetVar("blinded") then
        self:setNetVar("blinded", false)
    else
        self:setNetVar("blinded", true)
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function playerMeta:SetGagged()
    if self:getNetVar("gagged") then
        self:setNetVar("gagged", false)
    else
        self:setNetVar("gagged", true)
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function playerMeta:SetRestricted()
    if self:getNetVar("restricted") then
        self:setNetVar("restricted", false)
    else
        self:setNetVar("restricted", true)
    end
end