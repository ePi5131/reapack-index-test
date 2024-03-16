--[[
@provides [nomain] .
@description test-mod
@version 1.1
@author ePi
]]
local t={}

---@return string
function t.func()
    return "hello mod"
end

---@param a string[]
---@param b integer
---@return string, integer
function t.func2(a, b)
    return a[b%#a+1], b+42
end

return t