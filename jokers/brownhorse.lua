
SMODS.Joker{ --Brown Horse
    key = "brownhorse",
    config = {
        extra = {
            chips0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'Brown Horse',
        ['text'] = {
            [1] = '{C:blue}+50{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = 1,
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
                chips = 50
            }
        end
    end
}