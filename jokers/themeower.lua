
SMODS.Joker{ --The Meower
    key = "themeower",
    config = {
        extra = {
            xchips = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Meower',
        ['text'] = {
            [1] = 'This Joker gains {X:chips,C:white}X0.1{} Chips',
            [2] = 'when a {C:attention}3{} is scored',
            [3] = '{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_legendaries"] = true },
    soul_pos = {
        x = 5,
        y = 7
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xchips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 3 then
                card.ability.extra.xchips = (card.ability.extra.xchips) + 0.1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips
            }
        end
    end
}