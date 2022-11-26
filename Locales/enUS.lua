--localization file for english/United States
local L = LibStub("AceLocale-3.0"):NewLocale("SGTPricing", "enUS", true)
if not L then return end 

L["Pricing"] = "Pricing"
L["SGTPricingDescription"] = "This module provides pricing data to other SGT addons.\nAll prices are currently taken from TSM data, settings will be added here when/if more price sources are available."