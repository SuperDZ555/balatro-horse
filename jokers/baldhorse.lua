
SMODS.Joker{ --Bald Horse
    key = "baldhorse",
    config = {
        extra = {
            currentscoringchips = 0,
            blindchiprequirement = 0,
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Bald Horse',
        ['text'] = {
            [1] = 'Gain {C:money}$2{} if played hand scores less',
            [2] = 'than {C:attention}10%{} of required chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((G.GAME.blind.chips or 0)) * 0.1}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if SMODS.last_hand_score < to_big((G.GAME.blind.chips) * 0.1) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}