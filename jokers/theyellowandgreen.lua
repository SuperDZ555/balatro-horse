
SMODS.Joker{ --The Yellow and Green
    key = "theyellowandgreen",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Yellow and Green',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.3{} Mult if played',
            [2] = 'hand contains a {C:attention}three of a kind{}',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
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
        x = 6,
        y = 6
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
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint  then
            if next(context.poker_hands["Three of a Kind"]) then
                return {
                    func = function()
                        card.ability.extra.xmult = (card.ability.extra.xmult) + 0.3
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}