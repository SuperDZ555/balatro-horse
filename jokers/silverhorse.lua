
SMODS.Joker{ --Silver Horse
    key = "silverhorse",
    config = {
        extra = {
            chips0 = 50,
            mult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Silver Horse',
        ['text'] = {
            [1] = '{C:common}Common{} Jokers each give',
            [2] = '{C:blue}+50{} Chips and {C:red}+2{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 16,
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
    
    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
                return context.other_joker.config.center.rarity == 1
            end)() then
                return {
                    chips = 50,
                    extra = {
                        mult = 2
                    }
                }
            end
        end
    end
}