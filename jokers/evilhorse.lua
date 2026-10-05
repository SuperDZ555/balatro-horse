
SMODS.Joker{ --EVIL Horse
    key = "evilhorse",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'EVIL Horse',
        ['text'] = {
            [1] = 'If any {C:attention}discard{} has only {C:attention}1{} card,',
            [2] = 'destroy it and permanently add',
            [3] = '{C:blue}+30{} Chips to this {C:attention}Joker{}.',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        if context.discard  and not context.blueprint then
            if to_big(#context.full_hand) == to_big(1) then
                return {
                    remove = true,
                    message = "Destroyed!",
                    extra = {
                        func = function()
                            card.ability.extra.chips = (card.ability.extra.chips) + 30
                            return true
                        end,
                        colour = G.C.GREEN
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