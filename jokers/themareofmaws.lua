
SMODS.Joker{ --The Mare of Maws
    key = "themareofmaws",
    config = {
        extra = {
            xchips = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Mare of Maws',
        ['text'] = {
            [1] = 'If {C:attention}first hand{} of round has only {C:attention}1{} card, destroy',
            [2] = 'it for this Joker to gain {X:blue,C:white}X0.5{} Chips',
            [3] = '{C:inactive}(Currently {}{X:blue,C:white}X#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
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
        x = 8,
        y = 3
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
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (to_big(#context.full_hand) == to_big(1) and G.GAME.current_round.hands_played == 0) then
                context.other_card.should_destroy = true
                card.ability.extra.xchips = (card.ability.extra.xchips) + 0.5
                return {
                    extra = {
                        message = "Chomp!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.xchips
            }
        end
    end
}