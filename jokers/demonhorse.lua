
SMODS.Joker{ --Demon Horse
    key = "demonhorse",
    config = {
        extra = {
            sacrifice = 0
        }
    },
    loc_txt = {
        ['name'] = 'Demon Horse',
        ['text'] = {
            [1] = 'On final hand of round, destroy',
            [2] = 'all cards remaining in hand',
            [3] = 'After destroying 15 cards,',
            [4] = 'create a free {C:attention}Ethereal Tag{}',
            [5] = '{C:red}self destructs{}',
            [6] = '{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive}/15){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_TAGS["tag_ethereal"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        end
        return {vars = {card.ability.extra.sacrifice}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            context.other_card.should_destroy = false
            if to_big(G.GAME.current_round.hands_left) == to_big(0) then
				if not (to_big((card.ability.extra.sacrifice or 0)) >= to_big(15)) then
					context.other_card.should_destroy = true
					return {
						func = function()
							card.ability.extra.sacrifice = (card.ability.extra.sacrifice) + 1
							return true
						end,
						extra = {
							message = "Sacrifice!",
							colour = G.C.RED
						}
					}
				end
            end
        end
        if context.starting_shop  and not context.blueprint then
            if to_big((card.ability.extra.sacrifice or 0)) >= to_big(15) then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local tag = Tag("tag_ethereal")
                                tag:set_ability()
                                add_tag(tag)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end
                        }))
                        return true
                    end,
                    message = "Created Tag!",
                    extra = {
                        func = function()
                            local target_joker = card
                            
                            if target_joker then
                                if target_joker.ability.eternal then
                                    target_joker.ability.eternal = nil
                                end
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                        end,
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}