
SMODS.Joker{ --Rainbow Horse
    key = "rainbowhorse",
    config = {
        extra = {
            xmult0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Rainbow Horse',
        ['text'] = {
            [1] = '{X:red,C:white}X0.25{} Mult for every',
            [2] = 'unique {C:attention}Suit{} scored',
            [3] = '{C:inactive,s:0.7}(Additive, starts at{} {X:red,C:white,s:0.7}X1{} {C:inactive,s:0.7}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
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
			local uniquesuits = (function()
                local spades = 0
				local hearts = 0
				local diamonds = 0
				local clubs = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") then
                        spades = 1
                    end
					if playing_card:is_suit("Hearts") then
                        hearts = 1
                    end
					if playing_card:is_suit("Diamonds") then
                        diamonds = 1
                    end
					if playing_card:is_suit("Clubs") then
                        clubs = 1
                    end
                end
                return spades + hearts + diamonds + clubs
            end)()
            return {
                Xmult = 1 + (uniquesuits*0.25)
            }
        end
    end
}