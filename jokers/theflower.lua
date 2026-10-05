
SMODS.Joker{ --The Flower
    key = "theflower",
    config = {
        extra = {
            jokers = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Flower',
        ['text'] = {
            [1] = 'After every {C:attention}boss blind{}, gain {C:attention}+1{} Joker slot',
            [2] = '{C:inactive}(Currently {}{C:attention}+#1#{}{C:inactive} Joker slots){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        x = 6,
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
        
        return {vars = {card.ability.extra.jokers}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
					G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    card.ability.extra.jokers = (card.ability.extra.jokers) + 1
                    return true
                end,
                message = "Upgrade!"
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokers
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokers
    end
}