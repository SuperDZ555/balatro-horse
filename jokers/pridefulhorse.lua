
SMODS.Joker{ --Prideful Horse
    key = "pridefulhorse",
    config = {
        extra = {
            xmult0 = 2,
            mult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Prideful Horse',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult if played hand contains at',
            [2] = 'least 2 {C:attention}Kings{} or at least 2 {C:attention}Queens{}',
            [3] = 'Played {C:attention}Aces{} cards give {C:red}+5{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
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
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 13 then
                        count = count + 1
                    end
                end
                return count >= 2
            end)() or (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 12 then
                        count = count + 1
                    end
                end
                return count >= 2
            end)()) then
                return {
                    Xmult = 2
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    mult = 5
                }
            end
        end
    end
}