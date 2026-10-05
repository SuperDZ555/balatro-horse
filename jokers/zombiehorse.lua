
SMODS.Joker{ --Zombie Horse
    key = "zombiehorse",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Zombie Horse',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+25{} Chips if',
            [2] = 'played hand contains exactly',
            [3] = '1 {C:green}scoring{} card and at least',
            [4] = '3 {C:red}unscoring{} cards',
            [5] = '{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        
        return {vars = {card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.before and context.cardarea == G.jokers  then
            if (to_big(#context.scoring_hand) == to_big(1) and to_big((#context.full_hand - #context.scoring_hand)) >= to_big(3)) then
                return {
                    func = function()
                        card.ability.extra.chips = (card.ability.extra.chips) + 25
                        return true
                    end
                }
            end
        end
    end
}