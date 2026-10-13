
SMODS.Joker{ --Dumbass Fucking Unicorn
    key = "dumbassfuckingunicorn",
    config = {
        extra = {
            mult = 0,
            enhancedcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dumbass Fucking Unicorn',
        ['text'] = {
            [1] = '{C:red}+1{} Mult for each card with an',
            [2] = '{C:enhanced}Enhancement{} in your full deck',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.mult, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                card.ability.extra.mult = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}