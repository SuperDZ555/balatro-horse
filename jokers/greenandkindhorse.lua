
SMODS.Joker{ --Green and Kind Horse
    key = "greenandkindhorse",
    config = {
        extra = {
            discardsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'Green and Kind Horse',
        ['text'] = {
            [1] = 'Earn an additional {C:money}$1{} per remaining',
            [2] = '{C:red}Discard{} at end of each Round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.GAME.current_round.discards_left or 0)}}
    end, 
    
    calc_dollar_bonus = function(self, card)
        local blind_reward = 0
        blind_reward = blind_reward + math.max(G.GAME.current_round.discards_left, 0)
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
        end
    end
}