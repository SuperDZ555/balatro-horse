
SMODS.Joker{ --The Horse
    key = "thehorse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'The Horse',
        ['text'] = {
            [1] = 'When Blind is selected, create a {C:money}Negative{}',
            [2] = '{C:enhanced}Perishable{} {C:common}Common{} or {C:uncommon}Uncommon{} Horse'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_the_horse"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        end
        return {vars = {}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'horse_common_horses' })
                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                                joker_card:add_sticker('perishable', true)
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "neigh", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}