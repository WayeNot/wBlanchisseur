fx_version 'adamant'
game 'gta5'

author 'WayeNot'
description 'Shop'
version '1.0.0'

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
}

client_scripts {
    'client/*.lua',
    'config.lua'
}

server_script {
    'server/*.lua',
}