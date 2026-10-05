
SMODS.Joker{ --The Shapeshifter
    key = "theshapeshifter",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Shapeshifter',
        ['text'] = {
            [1] = 'Apply an upgraded {C:dark_edition}Edition{} to all played cards',
            [2] = '{s:0.7}In order: {}{C:dark_edition,s:0.7}Foil{}{s:0.7} > {}{C:dark_edition,s:0.7}Holographic{}{s:0.7} > {}{C:dark_edition,s:0.7}Polychrome{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_legendaries"] = true },
    soul_pos = {
        x = 2,
        y = 4
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_foil"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        end
        local info_queue_1 = G.P_CENTERS["m_holo"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        end
        local info_queue_2 = G.P_CENTERS["m_polychrome"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.edition and context.other_card.edition.key == "e_holo" then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_polychrome", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif context.other_card.edition and context.other_card.edition.key == "e_foil" then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_holo", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif context.other_card.edition == nil then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_foil", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}