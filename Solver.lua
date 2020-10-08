--[[
    Tax, Tip and Discount Solver
    Does what the title says.
]]
    
print("Enter the current price:")
local CurrentPrice = tonumber(io.read())

print("Tax/tip, discount or both?")
local Type = string.lower(io.read())
local Types = {
    ["tax"] = true,
    ["tip"] = true,
    ["discount"] = true,
    ["both"] = true
}

if not Types[Type] then return end

local Discount = 0
local TaxTip = 0

if Type == "both" then
    print("What is the discount percent?")
    Discount = tonumber(io.read())

    print("What is the tax percent?")
    TaxTip = tonumber(io.read())
elseif Type == "discount" then
    print("What is the discount percent?")
    Discount = tonumber(io.read())
elseif Type == "tax" or Type == "tip" then
    print("What is the " .. Type .. " percent?")
    TaxTip = tonumber(io.read())
end

local PercentDiscount = Discount / 100
local PercentTaxTip = TaxTip / 100

print("")

if Discount ~= 0 and TaxTip ~= 0 then
    local AmountDiscount = CurrentPrice * PercentDiscount
    local AmountTax = CurrentPrice * PercentTaxTip

    print("Amount Discount: $" .. AmountDiscount)
    print("Total Amount with Discount: $" .. CurrentPrice - AmountDiscount)

    print("")
    print("Amount Tax: $" .. AmountTax)
    print("Total Amount with Tax: $" .. CurrentPrice + AmountTax)

    print("")
    print("Total Amount with Discount and Tax: $" .. (CurrentPrice - AmountDiscount) + AmountTax)
elseif Discount ~= 0 then
    local AmountDiscount = CurrentPrice * PercentDiscount

    print("Amount Discount: $" .. AmountDiscount)
    print("Total Amount with Discount: $" .. CurrentPrice - AmountDiscount)
elseif TaxTip ~= 0 then
    local AmountTax = CurrentPrice * PercentTaxTip

    print("Amount Tax: $" .. AmountTax)
    print("Total Amount with Tax: $" .. CurrentPrice + AmountTax)
end
