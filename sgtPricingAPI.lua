local addonName, globalTable = ...

function SGTPricing:GetCurrentAuctionPriceByItemLink(itemLink)
    if itemLink == nil then
        return 0;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.tsmNameString) then
        local tsmPrice = SGTPricing:GetTSMPrice("DBMinBuyout", TSM_API.ToItemString(itemLink));
        return tsmPrice;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.auctionatorNameString) then
        local auctionatorPrice = SGTPricing:GetAuctionatiorPriceByItemLink(itemLink);
        return auctionatorPrice;
    end
    print(SGTPricing.db.profile.settings.priceSource)
    print(SGTPricing.L["Error_MissingSource"])
    return nil;
end

function SGTPricing:GetCurrentAuctionPriceByItemID(itemID)
    if itemID == nil then
        return 0;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.tsmNameString) then
        local tsmPrice = SGTPricing:GetTSMPrice("DBMinBuyout", "i:" .. tostring(itemID));
        return tsmPrice;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.auctionatorNameString) then
        local auctionatorPrice = SGTPricing:GetAuctionatiorPriceByItemID(itemID);
        return auctionatorPrice;
    end
    print(SGTPricing.db.profile.settings.priceSource)
    print(SGTPricing.L["Error_MissingSource"])
    return nil;
end

function SGTPricing:GetShortMarketPriceByItemLink(itemLink)
    if itemID == nil then
        return 0;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.tsmNameString) then
        local tsmPrice = SGTPricing:GetTSMPrice("DBRecent", TSM_API.ToItemString(itemLink));
        return tsmPrice;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.auctionatorNameString) then
        local auctionatorPrice = SGTPricing:GetAuctionatiorPriceByItemLink(itemLink);
        return auctionatorPrice;
    end
    print(SGTPricing.db.profile.settings.priceSource)
    print(SGTPricing.L["Error_MissingSource"])
    return nil;
end

function SGTPricing:GetShortMarketPriceByItemID(itemID)
    if itemID == nil then
        return 0;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.tsmNameString) then
        local tsmPrice = SGTPricing:GetTSMPrice("DBRecent", "i:" .. tostring(itemID));
        return tsmPrice;
    end
    if(SGTPricing.db.profile.settings.priceSource == SGTPricing.auctionatorNameString) then
        local auctionatorPrice = SGTPricing:GetAuctionatiorPriceByItemID(itemID);
        return auctionatorPrice;
    end
    print(SGTPricing.db.profile.settings.priceSource)
    print(SGTPricing.L["Error_MissingSource"])
    return nil;
end