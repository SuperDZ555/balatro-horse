
SMODS.Joker{ --3D Horse
    key = "threedimensionalhorse",
    config = {
        extra = {
            currentscoringchips = 0,
            currentscoringmult = 0,
            xmult0 = 2,
            xchips0 = 2
        }
    },
    loc_txt = {
        ['name'] = '3D Horse',
        ['text'] = {
            [1] = 'If either {C:blue}Chips{} or {C:red}Mult{} is',
            [2] = 'greater than three times',
            [3] = 'the other, {C:attention}double{} the other'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        
        return {vars = {hand_chips or 0, (mult or 0) * 3}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(hand_chips) > to_big((mult) * 3) then
                return {
                    Xmult = 2
                }
            elseif to_big((hand_chips) * 3) < to_big(mult) then
                return {
                    x_chips = 2
                }
            end
        end
    end
}