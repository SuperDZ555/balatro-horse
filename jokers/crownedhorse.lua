
SMODS.Joker{ --Crowned Horse
    key = "crownedhorse",
    config = {
        extra = {
            dollars0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Crowned Horse',
        ['text'] = {
            [1] = 'Destroy all cards played on the {C:attention}first hand{} of round,',
            [2] = 'and gain {C:money}$10{} for every card destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if G.GAME.current_round.hands_played == 0 then
                context.other_card.should_destroy = true
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 10
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                        return true
                    end,
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}