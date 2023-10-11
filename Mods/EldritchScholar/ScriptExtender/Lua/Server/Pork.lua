local RANDOM_STATUSES = {
    "ExperimentHeal",
    "ExperimentHarm"
}

local RANDOM_STATUSES2 = {
    "ExperimentHeal2",
    "ExperimentHarm2"
}

local RANDOM_STATUSES3 = {
    "ExperimentHeal3",
    "ExperimentHarm3"
}

local RANDOM_STATUSES4 = {
    "ExperimentHeal4",
    "ExperimentHarm4"
}



---@param caster Guid
---@param spell string
local function OnSpellCast(caster)




    local randomStatus
    local diff

    if Osi.HasPassive(caster,'ResearchAggressive1') or Osi.HasPassive(caster,'ResearchConservative1') then 
        diff=1
        randomStatus = RANDOM_STATUSES[Ext.Utils.Random(1, #RANDOM_STATUSES)]
    elseif Osi.HasPassive(caster,'ResearchAggressive2') or Osi.HasPassive(caster,'ResearchConservative2')  then
        diff=2
        randomStatus = RANDOM_STATUSES2[Ext.Utils.Random(1, #RANDOM_STATUSES2)]
    elseif Osi.HasPassive(caster,'ResearchAggressive3') or Osi.HasPassive(caster,'ResearchConservative3')  then
        diff=3
        randomStatus = RANDOM_STATUSES3[Ext.Utils.Random(1, #RANDOM_STATUSES3)]
    elseif Osi.HasPassive(caster,'ResearchAggressive4') or Osi.HasPassive(caster,'ResearchConservative4')  then
        diff=4
        randomStatus = RANDOM_STATUSES4[Ext.Utils.Random(1, #RANDOM_STATUSES4)]
    end


    Freeze(caster)
    Osi.ShowNotification(caster, "Experiment failed!")
    Osi.TimerLaunch("unfreeze",100)






end

Ext.Osiris.RegisterListener("TimerFinished", 1, "after", function (event)

if (event == "unfreeze") then
    Unfreeze(GetHostCharacter())
    
end

end)

Ext.Osiris.RegisterListener("UsingSpell", 5, "before", OnSpellCast)




