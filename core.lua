SGTPricing = LibStub("AceAddon-3.0"):NewAddon("SGTPricing", "AceConsole-3.0", "AceEvent-3.0");
SGTPricing.L = LibStub("AceLocale-3.0"):GetLocale("SGTPricing");

--Variables start
local SGTPricingVersion = "v1.0";
local priceFrame = nil;
--Variables end

function SGTPricing:OnInitialize()
	SGTPricing:RegisterChatCommand("tstp", "tst");
    SGTCore:AddTabWithFrame("SGTPricing", SGTPricing.L["Pricing"], SGTPricing.L["Pricing"], SGTPricingVersion, SGTPricing.OnCraftCostFrameCreated);
end

function SGTPricing:tst()
    print(SGTPricing:GetCurrentAuctionPrice("2840"));
end

function SGTPricing:OnCraftCostFrameCreated()
    local craftCostFrame = SGTCore:GetTabFrame("SGTPricing");
    local craftCostDescription = SGTCore:AddAnchoredFontString("SGTPricingDescriptionText", craftCostFrame.scrollframe.scrollchild, craftCostFrame, 5, -5, SGTPricing.L["SGTPricingDescription"], craftCostFrame);
end

function SGTPricing:GetCurrentAuctionPrice(itemID)
    local tsmPrice = TSM_API.GetCustomPriceValue("DBMinBuyout", "i:" .. itemID);
    return tsmPrice;
end