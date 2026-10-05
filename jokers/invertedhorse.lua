
SMODS.Joker{ --Inverted Horse
    key = "invertedhorse",
    config = {
        extra = {
            rounds = 0,
            chips0 = 150,
            xmult0 = 0.5
        }
    },
    loc_txt = {
        ['name'] = 'Inverted Horse',
        ['text'] = {
            [1] = '{C:blue}+150{} Chips',
            [2] = '{X:red,C:white}x0.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rounds}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 150,
                extra = {
                    Xmult = 0.5
                }
            }
        end
    end
}