
SMODS.Joker{ --Flamemare Horse
    key = "flamemarehorse",
    config = {
        extra = {
            scale0 = 1,
            rotation0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Flamemare Horse',
        ['text'] = {
            [1] = 'Every discarded {C:attention}card{}',
            [2] = 'permanently gains {C:red}+1{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
	
    calculate = function(self, card, context)
        if context.discard  then
            if (not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_horse_evilhorse" then 
                        return true
                    end
                end
            end)()) or to_big(#context.full_hand) > to_big(1)) then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 1
                return {
                    func = function()
                        card:juice_up(1, 1)
                        return true
                    end
                }
            end
        end
    end
}