
SMODS.Joker{ --Glitched Horse
    key = "glitchedhorse",
    config = {
        extra = {
            odds = 2,
            odds2 = 6,
            odds3 = 8,
            odds4 = 12,
            odds5 = 16,
            chips0_min = -10,
            chips0_max = 30,
            mult0_min = -10,
            mult0_max = 30,
            xmult0_min = 0.5,
            xmult0_max = 1.5,
            xchips0_min = 0.5,
            xchips0_max = 1.5,
            card_draw0_min = 1,
            card_draw0_max = 3,
            dollars0_min = 1,
            dollars0_max = 15
        }
    },
    loc_txt = {
        ['name'] = 'Glitched Horse',
        ['text'] = {
            [1] = '{C:white}??????????????????????????????????{}',
            [2] = '{C:white}?{}',
            [3] = '{C:white}?????????{}',
            [4] = '{C:white}?{}',
            [5] = '{C:white}??????????????{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
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
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_horse_glitchedhorse')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_horse_glitchedhorse')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_horse_glitchedhorse')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_horse_glitchedhorse')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_horse_glitchedhorse')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds6, 'j_horse_glitchedhorse')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds7, 'j_horse_glitchedhorse')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds8, 'j_horse_glitchedhorse')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_96c2ba48', 1, card.ability.extra.odds, 'j_horse_glitchedhorse', true) then
                    SMODS.calculate_effect({chips = pseudorandom('RANGE:-10|30', -10, 30)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_da025dc1', 1, card.ability.extra.odds, 'j_horse_glitchedhorse', true) then
                    SMODS.calculate_effect({mult = pseudorandom('RANGE:-10|30', -10, 30)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_fe6a744e', 1, card.ability.extra.odds2, 'j_horse_glitchedhorse', true) then
                    SMODS.calculate_effect({Xmult = pseudorandom('RANGE:0.5|1.5', 0.5, 1.5)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_74969395', 1, card.ability.extra.odds2, 'j_horse_glitchedhorse', true) then
                    SMODS.calculate_effect({x_chips = pseudorandom('RANGE:0.5|1.5', 0.5, 1.5)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_4_dc203464', 1, card.ability.extra.odds3, 'j_horse_glitchedhorse', true) then
                    SMODS.calculate_effect({swap = true}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = ",", colour = G.C.CHIPS})
                end
                if SMODS.pseudorandom_probability(card, 'group_5_23ec5cfa', 1, card.ability.extra.odds3, 'j_horse_glitchedhorse', true) then
                    if G.hand and #G.hand.cards > 0 then
                        SMODS.draw_cards(pseudorandom('RANGE:1|3', 1, 3))
                    end
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:1|3', 1, 3)).." Cards Drawn", colour = G.C.BLUE})
                end
                if SMODS.pseudorandom_probability(card, 'group_6_cc724d52', 1, card.ability.extra.odds4, 'j_horse_glitchedhorse', true) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + pseudorandom('RANGE:1|15', 1, 15)
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:1|15', 1, 15)), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_7_9beb7845', 1, card.ability.extra.odds5, 'j_horse_glitchedhorse', true) then
                        local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                        local base_card = create_playing_card({
                            front = card_front,
                            center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                        }, G.discard, true, false, nil, true)
                        
                        base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple'}, pseudoseed('add_card_hand_seal')), true)
                        
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        base_card.playing_card = G.playing_card
                        table.insert(G.playing_cards, base_card)
                        
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                G.hand:emplace(base_card)
                                base_card:start_materialize()
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "???", colour = G.C.GREEN})
                    end
                end
            end
        end
    }