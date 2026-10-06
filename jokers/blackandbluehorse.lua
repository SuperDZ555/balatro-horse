
SMODS.Joker{ --Black and Blue Horse
    key = "blackandbluehorse",
    config = {
        extra = {
            chips0 = 15,
            mult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Black and Blue Horse',
        ['text'] = {
            [1] = 'Each card of {C:spades}Spades{} or {C:clubs}Clubs{}',
            [2] = 'suit held in hand gives',
            [3] = '{C:blue}+15{} Chips and {C:red}+2{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
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
    pools = { ["horse_horse_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                return {
                    chips = 15,
                    extra = {
                        mult = 2
                    }
                }
            end
        end
    end
}