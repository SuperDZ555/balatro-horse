
-- SMODS.Joker{ --45° Angled Horse
    -- key = "45angledhorse",
    -- config = {
        -- extra = {
        -- }
    -- },
    -- loc_txt = {
        -- ['name'] = '45° Angled Horse',
        -- ['text'] = {
            -- [1] = 'If first hand of round is a single {C:attention}9{},',
            -- [2] = 'destroy it and create a {C:attention}4{} and a {C:attention}5{}',
            -- [3] = 'of the same {C:attention}suit{} and {C:edition}modifications{}'
        -- },
        -- ['unlock'] = {
            -- [1] = 'Unlocked by default.'
        -- }
    -- },
    -- pos = {
        -- x = 2,
        -- y = 3
    -- },
    -- display_size = {
        -- w = 71 * 1, 
        -- h = 95 * 1
    -- },
    -- cost = 9,
    -- rarity = 3,
    -- blueprint_compat = true,
    -- eternal_compat = true,
    -- perishable_compat = true,
    -- unlocked = true,
    -- discovered = true,
    -- atlas = 'CustomJokers',
    -- pools = { ["horse_horse_jokers"] = true },
    
    -- calculate = function(self, card, context)
        -- if context.individual and context.cardarea == G.play  then
            -- if ((G.GAME.current_round.hands_played == 0 and to_big(#context.scoring_hand) == to_big(1) and context.other_card:get_id() == 9)) then
				-- local rotated_suit = (context.other_card:is_suit("Hearts") and 'H') or (context.other_card:is_suit("Diamonds") and 'D') or (context.other_card:is_suit("Clubs") and 'C') or 'S'
				-- print(rotated_suit)
				-- local rotated_enhancement = (SMODS.get_enhancements(context.other_card)["m_gold"] and G.P_CENTERS.m_gold) or (SMODS.get_enhancements(context.other_card)["m_steel"] and G.P_CENTERS.m_steel) or (SMODS.get_enhancements(context.other_card)["m_glass"] and G.P_CENTERS.m_glass) or (SMODS.get_enhancements(context.other_card)["m_wild"] and G.P_CENTERS.m_wild) or (SMODS.get_enhancements(context.other_card)["m_mult"] and G.P_CENTERS.m_mult) or (SMODS.get_enhancements(context.other_card)["m_lucky"] and G.P_CENTERS.m_lucky) or (SMODS.get_enhancements(context.other_card)["m_bonus"] and G.P_CENTERS.m_bonus) or G.P_CENTERS.c_base
				
                -- local suit_prefix = rotated_suit
                -- local rank_suffix = '4'
                -- local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                -- local base_card = create_playing_card({
                    -- front = card_front,
                    -- center = rotated_enhancement
                -- }, G.discard, true, false, nil, true)
				
				-- if context.other_card.edition and context.other_card.edition.key == "e_foil" then base_card:set_edition("e_foil", true)
                -- elseif context.other_card.edition and context.other_card.edition.key == "e_holo" then base_card:set_edition("e_holo", true)
				-- elseif context.other_card.edition and context.other_card.edition.key == "e_polychrome" then base_card:set_edition("e_polychrome", true) end
				
				-- if context.other_card.seal ~= nil then base_card:set_seal(context.other_card.seal, true) end
				
				
                
                
                -- G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                -- base_card.playing_card = G.playing_card
                -- table.insert(G.playing_cards, base_card)
                
                -- G.E_MANAGER:add_event(Event({
                    -- func = function() 
                        -- G.hand:emplace(base_card)
                        -- base_card:start_materialize()
                        -- return true
                    -- end
                -- }))
                -- local suit_prefix = rotated_suit
                -- local rank_suffix = '5'
                -- local card_front = G.P_CARDS[suit_prefix..rank_suffix]
                -- local base_card = create_playing_card({
                    -- front = card_front,
                    -- center = rotated_enhancement
                -- }, G.discard, true, false, nil, true)
				
				-- if context.other_card.edition and context.other_card.edition.key == "e_foil" then base_card:set_edition("e_foil", true)
                -- elseif context.other_card.edition and context.other_card.edition.key == "e_holo" then base_card:set_edition("e_holo", true)
				-- elseif context.other_card.edition and context.other_card.edition.key == "e_polychrome" then base_card:set_edition("e_polychrome", true) end
                
				-- if context.other_card.seal ~= nil then base_card:set_seal(context.other_card.seal, true) end
                
                
                -- G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                -- base_card.playing_card = G.playing_card
                -- table.insert(G.playing_cards, base_card)
                
                -- G.E_MANAGER:add_event(Event({
                    -- func = function() 
                        -- G.hand:emplace(base_card)
                        -- base_card:start_materialize()
                        -- return true
                    -- end
                -- }))
                -- return {
                    -- message = "Rotated!",
                    -- extra = {
                        -- message = "Rotated!",
                        -- colour = G.C.GREEN
                    -- }
                -- }
			-- end
        -- end
    -- end
-- }