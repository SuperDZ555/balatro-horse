
SMODS.Joker{ --Clydesdale Horse
    key = "clydesdalehorse",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Clydesdale Horse',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+15{} Mult',
            [2] = 'if played hand contains',
            [3] = 'a scoring {C:attention}#2#{} card and',
            [4] = 'a scoring {C:attention}#3#{} card',
            [5] = '{C:inactive}(Currently {}{C:red}+#1#{}{C:inactive} Mult){}',
            [6] = '{s:0.8}Suits change on trigger{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult, localize((G.GAME.current_round.redSuit_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.blackSuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.redSuit_card or {}).suit or 'Spades'], G.C.SUITS[(G.GAME.current_round.blackSuit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.redSuit_card = { suit = 'Hearts' }
        G.GAME.current_round.blackSuit_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.redSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.blackSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                card.ability.extra.mult = (card.ability.extra.mult) + 15
                local suit_pool = {}
                G.GAME.current_round.redSuit_card.suit = pseudorandom_element(suit_pool, pseudoseed('randomSuit'))
                local suit_pool = {}
                G.GAME.current_round.blackSuit_card.suit = pseudorandom_element(suit_pool, pseudoseed('randomSuit'))
                return {
                    message = "Upgrade!",
                    extra = {
                        mult = card.ability.extra.mult
                    }
                }
            end
        end
    end
}