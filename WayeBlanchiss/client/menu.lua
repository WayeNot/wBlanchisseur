local OpenBlanchisseur = RageUI.CreateMenu('Blanchisseur', 'Voici les actions disponibles')

OpenBlanchisseur.Closed = function()
    OpenMenuBlanch = false
end

OpenBlanchisseur:SetRectangleBanner(29, 29, 29, 1)

function OpenWayeBlanch()
    if OpenMenuBlanch then
        RageUI.Visible(OpenBlanchisseur, false)
        OpenMenuBlanch = false
        return
    else
        RageUI.Visible(OpenBlanchisseur, true)
        OpenMenuBlanch = true
            CreateThread(function()
            while OpenMenuBlanch do
                for _, v in pairs(WayeBlanch) do                    
                    RageUI.IsVisible(OpenBlanchisseur, function()
                    RageUI.Separator('Le blanchisseur prend ~b~'..v.takeProfit..'%')
                    RageUI.Line()
                        RageUI.Button('~b~→~s~ Blanchir de l\'argent sale', nil, {RightLabel = '~b~→→→'},true, {
                            onSelected = function()
                                local argent = KeyboardInput("~s~Combien avez-vous à blanchir ?", "", 8, true)
                                TriggerServerEvent('wayeBlanch:Blanchisseur', argent)
                            end
                        })
                    end)
                end
                Wait(0)
            end
        end)
    end
end