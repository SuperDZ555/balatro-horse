
SMODS.Joker{ --Hooorse
    key = "hooorse",
    config = {
        extra = {
            chips = 0,
            init = 1
        }
    },
    loc_txt = {
        ['name'] = 'Hooorse',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+50{} Chips per',
            [2] = '{C:attention}consecutive{} hand played with',
            [3] = 'a single poker hand',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips, card.ability.extra.init, localize((G.GAME.current_round.hand_hand or 'High Card'), 'poker_hands')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.hand_hand = 'High Card'
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (context.scoring_name == G.GAME.current_round.hand_hand and not (to_big((card.ability.extra.init or 0)) == to_big(1))) then
                return {
                    func = function()
                        card.ability.extra.chips = (card.ability.extra.chips) + 50
                        return true
                    end,
                    message = "Upgrade!"
                }
            elseif (not (context.scoring_name == G.GAME.current_round.hand_hand) and not (to_big((card.ability.extra.init or 0)) == to_big(1))) then
                G.GAME.current_round.hand_hand = context.scoring_name
                return {
                    func = function()
                        card.ability.extra.chips = 50
                        return true
                    end,
                    message = "Reset"
                }
            elseif to_big((card.ability.extra.init or 0)) == to_big(1) then
				G.GAME.current_round.hand_hand = context.scoring_name
                return {
                    func = function()
                        card.ability.extra.chips = 50
                        return true
                    end,
                    message = "Set",
                    extra = {
                        func = function()
                            card.ability.extra.init = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}