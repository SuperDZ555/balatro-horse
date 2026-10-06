
SMODS.Joker{ --Brown Horse...?
    key = "fauxbrownhorse",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Brown Horse...?',
        ['text'] = {
            [1] = '{X:blue,C:white}X3{} Chips on {C:attention}boss blinds{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind.boss then
                return {
                    x_chips = 3
                }
            end
        end
        if context.end_of_round and context.game_over and context.main_eval  then
            if G.GAME.blind.boss then
                return {
                    message = "Pitiful."
                }
            end
        end
    end
}