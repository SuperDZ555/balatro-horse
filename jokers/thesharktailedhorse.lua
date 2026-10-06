
SMODS.Joker{ --The Shark Tailed Horse
    key = "thesharktailedhorse",
    config = {
        extra = {
            unscoring = 0,
            repetitions = 1,
            xchips0 = 1.5,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'The Shark Tailed Horse',
        ['text'] = {
            [1] = '{X:blue,C:white}X1.5{} Chips, {X:red,C:white}X1.5{} Mult',
            [2] = 'Triggers once for every played',
            [3] = 'card that doesn\'t score'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
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
        x = 7,
        y = 5
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
        
        return {vars = {card.ability.extra.unscoring}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((#context.full_hand - #context.scoring_hand)) >= to_big(1) then
                for i = 1, (#context.full_hand - #context.scoring_hand) do
                    SMODS.calculate_effect({x_chips = 1.5}, card)
                    SMODS.calculate_effect({Xmult = 1.5}, card)
                end
            end
        end
    end
}