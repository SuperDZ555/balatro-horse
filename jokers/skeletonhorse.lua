
SMODS.Joker{ --Skeleton Horse
    key = "skeletonhorse",
    config = {
        extra = {
            percent = 70
        }
    },
    loc_txt = {
        ['name'] = 'Skeleton Horse',
        ['text'] = {
            [1] = 'Prevents Death if Chips scored are',
            [2] = 'at least {C:attention}#1#%{} of required Chips',
            [3] = 'Increases by {C:attention}10%{} each death prevented'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.percent}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  and not context.blueprint then
            if to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(NaN) then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                            card.ability.extra.percent = (card.ability.extra.percent) + 10
                            return true
                        end,
                        message = "Saved!",
                        colour = G.C.GREEN
                    }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.percent or 0)) == to_big(100) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Collapsed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}