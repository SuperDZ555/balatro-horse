
SMODS.Joker{ --Steamhorse
    key = "steamhorse",
    config = {
        extra = {
            chips0 = 30
        }
    },
    loc_txt = {
        ['name'] = 'Steamhorse',
        ['text'] = {
            [1] = 'Each {C:attention}Face{} card held in',
            [2] = 'hand gives {C:blue}+30{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_face() then
                return {
                    chips = 30
                }
            end
        end
    end
}