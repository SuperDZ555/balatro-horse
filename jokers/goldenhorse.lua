
SMODS.Joker{ --Golden Horse
    key = "goldenhorse",
    config = {
        extra = {
            chips = 0,
            mult = 0,
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Golden Horse',
        ['text'] = {
            [1] = '{C:blue}+1{} Chip for every {C:money}$1{} you have',
            [2] = '{C:red}+2{} Mult for every {C:money}$5{} you have',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips,{} {C:red}+#2#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "horse_Special",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_race_horse_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'sou' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips, card.ability.extra.mult, (G.GAME.dollars or 0)}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            return {
                func = function()
                    card.ability.extra.chips = G.GAME.dollars
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.mult = math.floor((G.GAME.dollars) * (1/5))
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips,
                extra = {
                    mult = card.ability.extra.mult
                }
            }
        end
    end
}