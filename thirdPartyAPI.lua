local addonName, globalTable = ...

function SGTPricing:GetTSMPrice(priceType, tsmString)
    if tsmString == nil then
        return 0;
    end
    return TSM_API.GetCustomPriceValue(priceType, tsmString);
end

function SGTPricing:GetAuctionatiorPriceByItemLink(itemLink)
    if itemLink == nil then
        return 0;
    end
    return Auctionator.API.v1.GetAuctionPriceByItemLink("SGT Pricing", itemLink)
end

function SGTPricing:GetAuctionatiorPriceByItemID(itemID)
    if itemID == nil then
        return 0;
    end
    return Auctionator.API.v1.GetAuctionPriceByItemID("SGT Pricing", itemID)
end