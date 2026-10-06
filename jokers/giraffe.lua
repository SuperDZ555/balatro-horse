
SMODS.Joker{ --Giraffe
    key = "giraffe",
    config = {
        extra = {
            cardsremovedfromdeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Giraffe',
        ['text'] = {
            [1] = '{C:red}+3{} Mult for each card above',
            [2] = '{C:attention}#1#{} cards in your full deck',
            [3] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
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
        
        return {vars = {(G.GAME.starting_deck_size or 52), math.max(0,(((#(G.playing_cards or {}) - G.GAME.starting_deck_size) or 0)) * 3)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = math.max(0,(((#(G.playing_cards or {}) - G.GAME.starting_deck_size) or 0)) * 3)
            }
        end
    end
}