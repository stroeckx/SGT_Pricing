local addonName, globalTable = ...
SGTPricing.L = LibStub("AceLocale-3.0"):GetLocale("SGTPricing");

--Variables start
SGTPricing.majorVersion = 1;
SGTPricing.subVersion = 1;
SGTPricing.minorVersion = 1;
SGTPricing.tsmNameString = "TradeSkillMaster";
SGTPricing.auctionatorNameString = "Auctionator";
--Variables end

function SGTPricing:OnInitialize()
    SGTPricing.db = LibStub("AceDB-3.0"):New("SGTPricingDB", {
        profile = 
        {
            settings = 
            {
                priceSource = SGTPricing.tsmNameString,
            },
        },
    });

    SGTPricing.IsTSMLoaded = select(1,IsAddOnLoaded(SGTPricing.tsmNameString));
    SGTPricing.IsAuctionatorLoaded = select(1,IsAddOnLoaded(SGTPricing.auctionatorNameString));
    if(SGTPricing.IsTSMLoaded == false and SGTPricing.IsAuctionatorLoaded == false) then 
        message(SGTPricing.L["Error_PriceSourceRequired"]);
        return;
    end
    --SGTPricing.db.profile.settings.priceSource = SGTPricing.db.profile.settings.priceSource:gsub("%s+", "");
    if(SGTPricing.IsTSMLoaded == false and SGTPricing.IsAuctionatorLoaded == true) then
        SGTPricing.db.profile.settings.priceSource = SGTPricing.auctionatorNameString;
    end
	SGTPricing:RegisterChatCommand("tstp", "tst");
    SGTCore:AddTabWithFrame("SGTPricing", SGTPricing.L["Pricing"], SGTPricing.L["Pricing"], SGTPricing:GetVersionString(), SGTPricing.OnCraftCostFrameCreated);
end

function SGTPricing:GetVersionString()
    return tostring(SGTPricing.majorVersion) .. "." .. tostring(SGTPricing.subVersion) .. "." .. tostring(SGTPricing.minorVersion);
end

function SGTPricing:tst()
    --print(SGTPricing:GetCurrentAuctionPrice("2840"));
end

function SGTPricing:OnCraftCostFrameCreated()
    local heightOffset = -5 
    local craftCostFrame = SGTCore:GetTabFrame("SGTPricing");
    local ss = craftCostFrame.scrollframe.scrollchild;
    local craftCostDescription = SGTCore:AddAnchoredFontString("SGTPricingDescriptionText", ss, craftCostFrame, 5, heightOffset, SGTPricing.L["SGTPricingDescription"], craftCostFrame);
    heightOffset = heightOffset - 20;
    local knownSources = {};
    if(SGTPricing.IsTSMLoaded == true) then
        table.insert(knownSources, SGTPricing.tsmNameString);
    end
    if(SGTPricing.IsAuctionatorLoaded == true) then
        table.insert(knownSources, SGTPricing.auctionatorNameString);
    end
    SGTCore:AddDropdownMenu("SGTPriceSourceDropdown", ss, craftCostDescription, -5, 200, SGTPricing.L["PriceSource"] .. SGTPricing.db.profile.settings.priceSource, knownSources, SGTPricing.OnPriceSourceChanged, SGTPricing.GetCurrentPriceSourceSetting)
end

function SGTPricing:GetCurrentPriceSourceSetting()
    return SGTPricing.db.profile.settings.priceSource;
end

function SGTPricing:OnPriceSourceChanged(value, dropDown)
    SGTPricing.db.profile.settings.priceSource = value;
    UIDropDownMenu_SetText(dropDown, SGTPricing.L["PriceSource"] .. SGTPricing.db.profile.settings.priceSource);
end
