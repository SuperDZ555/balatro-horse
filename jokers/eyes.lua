
SMODS.Joker{ --:eyes:
    key = "eyes",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = ':eyes:',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+3{} Mult every time',
            [2] = 'the Joker to the left is triggered',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
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
        if context.post_trigger  and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					if context.other_card == (G.jokers.cards[i - 1] or 0) then
						return {
							func = function()
								card.ability.extra.mult = (card.ability.extra.mult) + 3
								return true
							end,
							message = ":eyes:"
						}
					else break
					end
				end
			end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}