--[[
 * ======================================================================== *
 * ?                                ABOUT
 * @title          :  main.lua
 * @description    :  Luger is an open sourced Murder Mystery 2 script
 * ======================================================================== *
--]]

_G.Testing = false

--[[ Important Variables ]]--
local Library = loadstring(game:HttpGet("https://github.com"))
local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
local Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/lugerr/main/main/src/libs/notify.lua"))()

local request = (syn and syn.request) or (http and http.request) or http_request

if game.PlaceId ~= 142823291 then
    if _G.Testing == true then return end

    prompt = ErrorPrompt.new("Default")
    prompt._hideErrorCode = true

    gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    
    prompt:setParent(gui)
    prompt:setErrorTitle("Luger")
    
    blur = Instance.new("BlurEffect")
    blur.Parent = game:GetService("Lighting")
    blur.Size = 24
    
    prompt:updateButtons({{
        Text = "Cancel",
        Callback = function()
            prompt:_close()
            blur:Destroy()

            return
       end
    },
    {
        Text = "Join",
        Primary = true,
        Callback = function()
            prompt:_close()
            blur:Destroy()
        end,
    }}, 'Default')

    prompt:_open("Your current game isn't supported. Press \"Join\" to join Murder Mystery 2")
end

--[[ Data ]]--

local TextInFile = "TweedLeak#4003"
local Discord_Invite = "CtKnhbnJa4"
local FolderName = "Enhanced Software"
local Folder2 = "/Discord Invites" -- Dont Touch "/"
local FileName = "/Enhanced Software.gg" -- Dont Touch "/"

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
                Notify("Copied to clipboard", "Your exploit doesn't support http requests, the invite has been copied to your clipboard.")
                setclipboard("https://discord.gg/dqUm8nBtkC")
            end
        end,
    }}, 'Default')

    prompt:_open("Would you like to join the Discord server?")

    writefile('Luger/discord.txt', '')
end