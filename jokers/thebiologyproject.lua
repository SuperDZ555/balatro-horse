
SMODS.Joker{ --The Biology Project
    key = "thebiologyproject",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Biology Project',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.1{} Mult',
            [2] = 'for every {C:attention}Seal{}, {C:enhanced}Enhancement{}, and',
            [3] = '{C:dark_edition}Edition{} on cards used in scoring',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        x = 8,
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
        if context.before and context.cardarea == G.jokers  then
			local mods = (function() --combined total of editions, seals, and enhancements across all scoring playing cards
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card.edition then --if this card has an edition, increase count
                        count = count + 1
                    end
					if playing_card.seal then --if this card has a seal, increase count
                        count = count + 1
                    end
					if next(SMODS.get_enhancements(playing_card)) then --if this card has an enhancement, increase count
                        count = count + 1
                    end
                end
                return count
            end)()
            return {
                func = function()
					card.ability.extra.xmult = (card.ability.extra.xmult) + (mods * 0.1)
					return true
				end
			}
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}