
SMODS.Joker{ --Shy Horse
    key = "shyhorse",
    config = {
        extra = {
            mult0 = 12
        }
    },
    loc_txt = {
        ['name'] = 'Shy Horse',
        ['text'] = {
            [1] = '{C:red}+12{} Mult for every card {C:attention}less than 5{} played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 60 - (#context.full_hand * 12)
            }
        end
    end
}