local pianoPlayed = false

RegisterNetEvent("qvr-piano:PianoPlay",function(position,heading,animation)
    local pos = position
    local head = heading
    local anim = nil 
    if IsPedMale(PlayerPedId()) then 
        anim =  animation.Man
    else anim = animation.Woman end

    if not pianoPlayed then 
        pianoPlayed = true
        TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey(anim), pos.x - 0.08, pos.y, pos.z + 0.03, head, 0, true, true, 0, true) 
    end      
end)

RegisterNetEvent("qvr-piano:PianoPause",function()
    pianoPlayed = false
    ClearPedTasks(PlayerPedId())
end)


CreateThread(function()
    for k, v in pairs(Config.PianoLocation) do
        exports['qbr-core']:createPrompt("qvr-piano:Piano"..k, vector3(v.SitPosition.x, v.SitPosition.y, v.SitPosition.z), Config.Sit, 'Piano', {
            type = 'client',
            event = 'qvr-piano:PianoPlay',
            args = {v.SitPosition,v.SitHeading,v.Animation}
        })
        exports['qbr-core']:createPrompt("qvr-piano:PianoRemove"..k, vector3(v.SitPosition.x, v.SitPosition.y, v.SitPosition.z), Config.GetUp, 'Get Up', {
            type = 'client',
            event = 'qvr-piano:PianoPause',
        })

    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        for k,v in pairs(Config.PianoLocation) do 
            exports['qbr-core']:deletePrompt('qvr-piano:Piano'..k)
            exports['qbr-core']:deletePrompt('qvr-piano:PianoRemove'..k)
        end
    end
end)

