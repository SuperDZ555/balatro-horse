
SMODS.Joker{ --Horse Hell 1999
    key = "horsehell1999",
    config = {
        extra = {
            mult = 40,
            pb_mult_932cdb30 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Horse Hell 1999',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult',
            [2] = 'When a card is scored, it',
            [3] = 'permanently takes {C:red}+5{}',
            [4] = 'Mult from this Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if to_big((card.ability.extra.mult or 0)) == to_big(0) then
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
            else
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 5
                card.ability.extra.mult = math.max(0, (card.ability.extra.mult) - 5)
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}