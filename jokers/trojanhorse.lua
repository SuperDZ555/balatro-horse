
SMODS.Joker{ --Trojan Horse
    key = "trojanhorse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Trojan Horse',
        ['text'] = {
            [1] = '{C:blue}+50{} Chips..?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_trojan_horse"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
            or args.source == 'sho' or args.source ~= 'buf' or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'horse_horse_jokers' })
                            if joker_card then
                                
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end,
                extra = {
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Surprise!", colour = G.C.RED})
                        end
                        return true
                    end,
                    colour = G.C.RED
                }
            }
        end
    end
}