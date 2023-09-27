--[[
@description test-reascript
@version 1.1
@author ePi
]]
local R=reaper

local mod
do
    local function E(x,y)return x or error(y)end
    local ext_key="ePi-reapack-index-test"
    local ext_mod_code="mod.code"
    local mod_fn
    if(R.HasExtState(ext_key,ext_mod_code))then
        mod_fn=E(load(R.GetExtState(ext_key,ext_mod_code)))
    else
        local file=io.open(R.GetResourcePath()..[[\Scripts\ePi-reapack-index-test\src\test-mod.lua]])
        if(file==nil)then
            R.ShowConsoleMsg"Require test-mod"
            R.ReaPack_BrowsePackages"test-mod"
            return
        end
        local code=file:read"a"
        file:close()
        R.SetExtState(ext_key,ext_mod_code,code,false)
        mod_fn=E(load(code))
    end
    mod=mod_fn()
end

R.ShowConsoleMsg(mod.func())