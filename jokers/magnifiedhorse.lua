
SMODS.Joker{ --Magnified Horse
    key = "magnifiedhorse",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Magnified Horse',
        ['text'] = {
            [1] = 'When a {C:attention}card{} is scored,',
            [2] = 'this Joker gains 1.5x',
            [3] = 'the card\'s rank as {C:blue}Chips{}.',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        
        return {vars = {card.ability.extra.chips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
			if (context.other_card:get_id() == 10 or context.other_card:is_face()) then
                card.ability.extra.chips = (card.ability.extra.chips) + 15
			else card.ability.extra.chips = (card.ability.extra.chips) + (context.other_card:get_id() * 1.5) end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}