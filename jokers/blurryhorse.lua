
SMODS.Joker{ --Blurry Horse
    key = "blurryhorse",
    config = {
        extra = {
            init = 0,
            discards0 = 1,
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Blurry Horse',
        ['text'] = {
            [1] = 'The {C:attention}first{} hand or discard',
            [2] = 'of reach round is free'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.init}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.init = 1
                    return true
                end
            }
        end
        if context.pre_discard  and not context.blueprint then
            if to_big((card.ability.extra.init or 0)) == to_big(1) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Free!", colour = G.C.GREEN})
                        
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 1
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.init = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big((card.ability.extra.init or 0)) == to_big(1) then
                card.ability.extra.init = 0
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Free!", colour = G.C.GREEN})
                        
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end
                }
            end
        end
    end
}