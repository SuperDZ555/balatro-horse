
SMODS.Joker{ --Glass Horse
    key = "glasshorse",
    config = {
        extra = {
            chips = 0,
            glasscardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glass Horse',
        ['text'] = {
            [1] = 'Gives {C:red}+10{} Mult for each',
            [2] = '{C:attention}Glass Card{} in your full deck',
            [3] = '{C:inactive}(Currently {}{C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_glass"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_glass\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
    return {vars = {card.ability.extra.chips, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_glass') then count = count + 1 end end; return count end)()) * 15}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                card.ability.extra.chips = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_glass') then count = count + 1 end end; return count end)()) * 15
                    return true
                end
            }
        end
    end
}