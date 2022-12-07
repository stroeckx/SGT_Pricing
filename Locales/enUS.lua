--localization file for english/United States
local L = LibStub("AceLocale-3.0"):NewLocale("SGTPricing", "enUS", true)
if not L then return end 

L["Pricing"] = "Pricing"
L["SGTPricingDescription"] = "This module provides pricing data to other SGT addons.\nCurrently supported price sources are TradeSkillMaster and Auctionator.\nTradeskillmaster has more pricing options but currently has potential issues while they are updating bonusID's.\nAuctionator can only provide min buyout pricing from the last manual scan."
L["Error_PriceSourceRequired"] = "SGT Pricing needs at least one price source to function, currently supported price sources are Tradeskillmaster and Auctionator"
L["PriceSource"] = "Price Source: "
L["Error_MissingSource"] = "SGT price source setting does not match any known settings, please report this as a bug."
