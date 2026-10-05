
SMODS.Joker{ --Scribble Horse
    key = "scribblehorse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Scribble Horse',
        ['text'] = {
            [1] = 'Give every {C:attention}number{} card without',
            [2] = 'an {C:attention}Enhancement{} scored',
            [3] = 'a random {C:attention}Enhancement{}',
            [4] = 'between {C:attention}Bonus{}, {C:attention}Mult{}, or {C:attention}Wild{}'
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
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_bonus"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_bonus\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_mult"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_mult\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["m_wild"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {localize((G.GAME.current_round.enhancement_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.enhancement_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.enhancement_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (not (context.other_card:is_face()) and not (context.other_card:get_id() == 14) and not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)())) then
                local suit_pool = {}
                G.GAME.current_round.enhancement_card.suit = pseudorandom_element(suit_pool, pseudoseed('randomSuit'))
            elseif (not (context.other_card:is_face()) and not (context.other_card:get_id() == 14) and not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) and G.GAME.current_round.enhancement_card.suit == "[object Object]") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_wild)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (not (context.other_card:is_face()) and not (context.other_card:get_id() == 14) and not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) and G.GAME.current_round.enhancement_card.suit == "[object Object]") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_mult)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (not (context.other_card:is_face()) and not (context.other_card:get_id() == 14) and not ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)()) and G.GAME.current_round.enhancement_card.suit == "[object Object]") then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_bonus)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}