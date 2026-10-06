
SMODS.Joker{ --Winterpony Horse
    key = "winterponyhorse",
    config = {
        extra = {
            xchips0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Winterpony Horse',
        ['text'] = {
            [1] = '{X:blue,C:white}X1.25{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 1.25
            }
        end
    end
}