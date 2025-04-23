--[[
@provides [main] . > $package/
@description test-reascript
@version 1.3
@author ePi
]]
local R=reaper

local mod
do
    local mod_fn,err=loadfile(R.GetResourcePath()..[[\Scripts\ePi-reapack-index-test\src\test-mod.lua]],"t")
    if(mod_fn==nil)then
        ---@diagnostic disable-next-line: need-check-nil
        if(err:match"cannot open")then
            R.ShowConsoleMsg"Requires test-mod"
            R.ReaPack_BrowsePackages"test-mod"
            return
        end
        error(err)
    end
    mod=mod_fn()--[[@as MOD]]
end

R.ShowConsoleMsg(mod.func())
local s,i=mod.func2({"hoge","fuga","piyo"},42)
R.ShowConsoleMsg(s)
R.ShowConsoleMsg(tostring(i))