
SMODS.Joker{ --Race Horse
    key = "racehorse",
    config = {
        extra = {
            rounds = 0,
            skips = 0,
            chips0 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Race Horse',
        ['text'] = {
            [1] = '{C:blue}+10{} Chips',
            [2] = 'In {C:attention}2{} rounds, replace this {C:attention}Joker{}',
            [3] = 'with a Bronze, Silver or Golden',
            [4] = 'Horse depending on how many',
            [5] = 'blinds you\'ve skipped',
            [6] = '{C:inactive}(Currently #1#/2){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 2,
    rarity = "horse_Special",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_race_horse_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'sou' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rounds, card.ability.extra.skips}}
    end,
    
    calculate = function(self, card, context)
        if context.skip_blind  then
            return {
                func = function()
                    card.ability.extra.skips = (card.ability.extra.skips) + 1
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.rounds or 0)) == to_big(1) then
				local horsekey = 'j_horse_bronzehorse'
				if to_big((card.ability.extra.skips or 0)) == to_big(4) then horsekey = 'j_horse_goldenhorse'
				elseif to_big((card.ability.extra.skips or 0)) >= to_big(2) then horsekey = 'j_horse_silverhorse'
				end
                return {
                    func = function()
					
						local created_joker = true
						G.E_MANAGER:add_event(Event({
							func = function()
								local joker_card = SMODS.add_card({ set = 'Joker', key = horsekey })
								if joker_card then
									
									
								end
								
								return true
							end
						}))
						
						if created_joker then
							card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
						end
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
                    end
                }
			else
					return {
						func = function()
							card.ability.extra.rounds = (card.ability.extra.rounds) + 1
							return true
						end
					}
			end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 10
            }
        end
    end
}