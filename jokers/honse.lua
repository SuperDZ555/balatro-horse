
SMODS.Joker{ --Honse
    key = "honse",
    config = {
        extra = {
            dollars0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Honse',
        ['text'] = {
            [1] = 'Every scoring {C:attention}face{} or {C:attention}Ace{} card gives {C:money}$3{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
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
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() or context.other_card:get_id() == 14) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 3
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}