
SMODS.Joker{ --Qorse
    key = "qorse",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Qorse',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+1{} Mult for every',
            [2] = 'playing card counted in scoring',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 6
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
        if context.before and context.cardarea == G.jokers and not context.blueprint  then
			return {
				func = function()
					card.ability.extra.mult = (card.ability.extra.mult) + #context.scoring_hand
					return true
				end
			}
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}