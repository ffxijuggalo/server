-----------------------------------
-- Area: Pso'xja
--  NPC: ???
-- Notes: Used to spawn Golden-Tongued Culberry
-- !pos -270.063 31.395 256.812 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local pendantChance = 0
    if npcUtil.tradeHas(trade, 18014) then -- odorous knife
        pendantChance = 500
    elseif npcUtil.tradeHas(trade, 18016) then -- odorous knife +1
        pendantChance = 1000
    end

    if
        pendantChance > 0 and
        npcUtil.popFromQM(player, npc, ID.mob.GOLDEN_TONGUED_CULBERRY)
    then
        player:confirmTrade()
        SetDropRate(1190, 13145, pendantChance)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.BROKEN_KNIFE)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
