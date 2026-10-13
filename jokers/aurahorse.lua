
SMODS.Joker{ --Aura Horse
    key = "aurahorse",
    config = {
        extra = {
            mult = 0,
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Aura Horse',
        ['text'] = {
            [1] = 'Gives {C:red}Mult{} depending',
            [2] = 'on Ante and Stake',
            [3] = '(Currently {C:red}+#1#{} Mult)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult, (G.GAME.round_resets.ante or 0), (G.GAME.stake or 0)}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                    card.ability.extra.mult = (G.GAME.round_resets.ante or 0) * (G.GAME.stake or 0)
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