ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('wayeBlanch:Blanchisseur')
AddEventHandler('wayeBlanch:Blanchisseur', function(argent)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getBlackMoney = xPlayer.getAccount('black_money').money
    local argent = ESX.Math.Round(tonumber(argent))
    local argentFinal = ESX.Math.Round(argent * 0.5)

    if argent > 0 and getBlackMoney >= argent then
        TriggerClientEvent('toz-notifications:sendNotification', _src, {
            text = 'Je te blanchi ça',
            title = 'Blanchisseur',
            type = 'info',
            duration = 5000
        })
        xPlayer.removeAccountMoney('black_money', argent)
        Citizen.SetTimeout(5000, function()
            TriggerClientEvent('toz-notifications:sendNotification', _src, {
                text = 'Vous avez reçu : ~b~'..argentFinal..'$~s~ du blanchisseur',
                title = 'Blanchisseur',
                type = 'success',
                duration = 5000
            })
            xPlayer.addAccountMoney('money', argentFinal)
        end)
    else
        TriggerClientEvent('toz-notifications:sendNotification', _src, {
            text = 'Montant invalide !',
            title = 'Blanchisseur',
            type = 'error',
            duration = 5000
        })
    end
end)