
SMODS.Joker{ --Flipped Horse
    key = "flippedhorse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Flipped Horse',
        ['text'] = {
            [1] = '{C:enhanced}Swap{} {C:blue}Chips{} and {C:red}Mult{} of played',
            [2] = '{C:attention}poker hand{} before scoring'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            return {
                swap = true,
                message = "!pliF"
            }
        end
    end
}