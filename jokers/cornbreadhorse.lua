
SMODS.Joker{ --Cornbread Horse
    key = "cornbreadhorse",
    config = {
        extra = {
            blind_reward0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Cornbread Horse',
        ['text'] = {
            [1] = 'Earn {C:money}$5{} at end of {C:attention}Big Blinds{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true }, 
    
    calc_dollar_bonus = function(self, card)
        local blind_reward = 0
        if G.GAME.blind:get_type() == 'Big' then
            blind_reward = blind_reward + math.max(5, 0)
        end
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.GAME.blind:get_type() == 'Big' then
            end
        end
    end
}