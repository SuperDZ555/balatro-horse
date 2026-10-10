
SMODS.Joker{ --House Horse
    key = "househorse",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'House Horse',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+4{} Mult if',
            [2] = 'played hand contains a {C:attention}Full House{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
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
        
        return {vars = {card.ability.extra.mult}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
			if (next(context.poker_hands["Full House"])) then
				if (next(context.poker_hands["Flush"])) then
					return {
						func = function()
							card.ability.extra.mult = (card.ability.extra.mult) + 8
							return true
						end,
						extra = {
							message = "Bonus!",
							colour = G.C.RED
						}
					}
				else
					return {
						func = function()
							card.ability.extra.mult = (card.ability.extra.mult) + 4
							return true
						end
					}
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