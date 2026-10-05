
SMODS.Joker{ --45° Angled Horse
    key = "45angledhorse",
    config = {
        extra = {
            seal = 'Gold'
        }
    },
    loc_txt = {
        ['name'] = '45° Angled Horse',
        ['text'] = {
            [1] = 'If first hand of round consists',
            [2] = 'only of a single {C:attention}4{} and a single {C:attention}5{},',
            [3] = 'combine them into a single {C:attention}9{}',
			[4] = '{s:0.7,C:inactive}The left card contributes {}{s:0.7,C:attention}Suit{}{s:0.7,C:inactive} and {}{s:0.7,C:enhanced}Seal{}',
            [5] = '{s:0.7,C:inactive}The right card contributes {}{s:0.7,C:enhanced}Enhancement{}{s:0.7,C:inactive} and {}{s:0.7,C:edition}Edition{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.seal, localize((G.GAME.current_round.suit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.suit_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.should_destroy = false
			local hand_is_45 = to_big(#context.full_hand) == to_big(2) and (function()
                local count4 = 0
				local count5 = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == 4 then count4 = count4 + 1 end
					if playing_card:get_id() == 5 then count5 = count5 + 1 end
                end
                return (count4 == 1) and (count5 == 1)
            end)()
            if (hand_is_45 and context.other_card == context.full_hand[1]) then
                G.GAME.current_round.suit_card.suit = context.other_card.base.suit
                card.ability.extra.seal = context.other_card.seal or nil
				context.other_card.should_destroy = true
                return {
                    message = "Fused!"
                }
			end
            if (hand_is_45 and context.other_card == context.full_hand[2]) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, G.GAME.current_round.suit_card.suit, "9"))
                        if card.ability.extra.seal ~= nil then scored_card:set_seal(card.ability.extra.seal, true) else scored_card:set_seal(nil) end
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Fused!", colour = G.C.ORANGE})
                        return true
                    end
                }))
			end
        end
		
		if context.modify_scoring_hand and not context.blueprint then
			local hand_is_45 = to_big(#context.full_hand) == to_big(2) and (function()
					local count4 = 0
					local count5 = 0
					for _, playing_card in pairs(context.full_hand or {}) do
						if playing_card:get_id() == 4 then count4 = count4 + 1 end
						if playing_card:get_id() == 5 then count5 = count5 + 1 end
					end
					return (count4 == 1) and (count5 == 1)
				end)()
			if hand_is_45 then 
				return {
					add_to_hand = true
				}
			end
        end
    end
}