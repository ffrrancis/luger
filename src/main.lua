--[[
 * ======================================================================== *
 * ?                                ABOUT
 * @title          :  main.lua
 * @description    :  Luger is an open sourced Murder Mystery 2 script
 * ======================================================================== *
--]]

_G.Testing = true
_G.Supported = nil

--[[ Important Variables ]]--
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lugerr/main/main/src/libs/ui.lua"))
local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/lugerr/main/main/src/libs/notify.lua"))()

if game.PlaceId ~= 142823291 then
    if _G.Testing ~= true then
        Notify("Luger", "Your current game isn't supported", 2)
        return
    end
end

local request = (syn and syn.request) or (http and http.request) or http_request

local Window = Library.Load({
    Title = "Luger",
    Style = 2,
    SizeX = 300,
    SizeY = 350,
    Theme = "Dark",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(51, 51, 51),
        Minimise = Color3.fromRGB(255, 255, 255),
        MinimiseAccent = Color3.fromRGB(255, 255, 255),
		Maximise = Color3.fromRGB(255,255,255),
		MaximiseAccent = Color3.fromRGB(255,255,255),
        TitleBar = Color3.fromRGB(35,37,39)
    }
})

local Home = Window.New({ Title = "HOME" })
local Combat = Window.New({ Title = "COMBAT" })
local Visuals = Window.New({ Title = "VISUALS" })
local Settings = Window.New({ ImageID = 4431163567 })

--[[ Data ]]--

if not isfolder('/Luger') then
    makefolder('/Luger')
end

if not isfile('/Luger/discord.txt') then
    prompt = ErrorPrompt.new("Default")
    prompt._hideErrorCode = true

    gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    
    prompt:setParent(gui)
    prompt:setErrorTitle("Luger")
    
    blur = Instance.new("BlurEffect")
    blur.Parent = game:GetService("Lighting")
    blur.Size = 24
    
    prompt:updateButtons({{
        Text = "No",
        Callback = function()
            prompt:_close()
            blur:Destroy()

            return
       end
    },
    {
        Text = "Yes",
        Primary = true,
        Callback = function()
            prompt:_close()
            blur:Destroy()

            if request then
                request({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = HttpService:JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = HttpService:GenerateGUID(false),
                        args = {code = "dqUm8nBtkC"}
                    })
                })
            else
                -- i have no idea why i added this (what exploit doesnt have http requests??)
                Notify("Copied to clipboard", "Your exploit doesn't support http requests, the invite has been copied to your clipboard.", 2)
                setclipboard("https://discord.gg/dqUm8nBtkC")
            end
        end,
    }}, 'Default')

    prompt:_open("Would you like to join the Discord server?")

    writefile('Luger/discord.txt', '')
end