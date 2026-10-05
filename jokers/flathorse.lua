
SMODS.Joker{ --Flat Horse
    key = "flathorse",
    config = {
        extra = {
            repetitions0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Flat Horse',
        ['text'] = {
            [1] = 'Cards without an {C:attention}Enhancement{} are retriggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}