
SMODS.Joker{ --Black Horse
    key = "blackhorse",
    config = {
        extra = {
            currentscoringchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Black Horse',
        ['text'] = {
            [1] = 'Add half of current {C:blue}Chips{} to {C:red}Mult{}',
			[2] = '{C:inactive}Max of {C:attention}100%{C:inactive} of {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {hand_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = math.min(hand_chips/2,mult)
            }
        end
    end
}
