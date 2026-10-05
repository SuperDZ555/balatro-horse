
SMODS.Joker{ --Business Horse
    key = "businesshorse",
    config = {
        extra = {
            energy = 60
        }
    },
    loc_txt = {
        ['name'] = 'Business Horse',
        ['text'] = {
            [1] = '{C:blue}+30{} Chips per consumable used',
            [2] = '{C:blue}-15{} Chips per hand played',
            [3] = '{C:red}self destructs{} on {C:blue}0{} Chips',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.energy}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.energy = math.max(0, (card.ability.extra.energy) - 15)
            return {
                chips = card.ability.extra.energy
            }
        end
        if context.using_consumeable  then
            return {
                func = function()
                    card.ability.extra.energy = (card.ability.extra.energy) + 30
                    return true
                end
            }
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.energy or 0)) == to_big(0) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:shatter({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Crash!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}