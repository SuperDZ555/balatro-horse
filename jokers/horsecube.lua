
SMODS.Joker{ --Horse Cube
    key = "horsecube",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Horse Cube',
        ['text'] = {
            [1] = '{X:blue,C:white}X3{} Chips if played hand contains exactly three {C:attention}3{}s'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 3 then
                        count = count + 1
                    end
                end
                return count == 3
            end)() then
                return {
                    x_chips = 3
                }
            end
        end
    end
}