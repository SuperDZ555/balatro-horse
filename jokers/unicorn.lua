
SMODS.Joker{ --Unicorn
    key = "unicorn",
    config = {
        extra = {
            editions = 1,
            foilcardsindeck = 0,
            holographiccardsindeck = 0,
            polychromecardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Unicorn',
        ['text'] = {
            [1] = '{X:red,C:white}X0.2{} Mult for every {C:attention}playing{}',
			[2] = '{C:attention}card{} with an {C:dark_edition}Edition{} owned',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
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
        
    return {vars = {card.ability.extra.editions, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.foil then count = count + 1 end end; return count end)()) * 0.2, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.holo then count = count + 1 end end; return count end)()) * 0.2, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.polychrome then count = count + 1 end end; return count end)()) * 0.2}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            local editions_value = card.ability.extra.editions
            return {
                func = function()
                    card.ability.extra.editions = 1
                    return true
                end,
                extra = {
                    func = function()
                    card.ability.extra.editions = (card.ability.extra.editions) + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.foil then count = count + 1 end end; return count end)()) * 0.2
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                        card.ability.extra.editions = (card.ability.extra.editions) + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.holo then count = count + 1 end end; return count end)()) * 0.2
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                            card.ability.extra.editions = (card.ability.extra.editions) + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.edition and card.edition.polychrome then count = count + 1 end end; return count end)()) * 0.2
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.editions
            }
        end
    end
}