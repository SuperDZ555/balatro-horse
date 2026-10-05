
SMODS.Joker{ --White Horse
    key = "whitehorse",
    config = {
        extra = {
            chips = 0,
            currentscoringchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'White Horse',
        ['text'] = {
            [1] = 'Gain {C:money}$1{} for every {C:blue}100{}',
            [2] = 'Chips in current hand',
            [3] = '{C:inactive}(Max of {}{C:money}$15{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.chips, (hand_chips or 0) * 0.01}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local chips_value = card.ability.extra.chips
            card.ability.extra.chips = (hand_chips or 0) * 0.01
            card.ability.extra.chips = math.floor(card.ability.extra.chips)
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + chips_value
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(chips_value), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}