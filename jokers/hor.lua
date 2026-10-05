
SMODS.Joker{ --Hor
    key = "hor",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hor',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+4{} Mult',
			[2] = 'when each played 2 is scored',
            [3] = '{C:inactive}(Currently {}{C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                card.ability.extra.mult = (card.ability.extra.mult) + 4
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}