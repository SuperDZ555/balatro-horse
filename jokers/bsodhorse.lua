
SMODS.Joker{ --BSOD Horse
    key = "bsodhorse",
    config = {
        extra = {
            currentscoringmult = 0,
            xmult0 = -1.5
        }
    },
    loc_txt = {
        ['name'] = 'BSOD Horse',
        ['text'] = {
            [1] = 'Disable the effect of every boss blind',
            [2] = '{X:red,C:white}X-1.5{} Mult'
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
    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {mult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big(mult) < to_big(0) then
                return {
                    message = "Nice try.",
					sound = "horse_winxperror"
                }
            else
                return {
                    Xmult = -1.5
                }
            end
        end
        
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
            SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
            SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
        end
        
    end
}