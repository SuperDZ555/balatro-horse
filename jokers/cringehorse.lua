
SMODS.Joker{ --Cringe Horse
    key = "cringehorse",
    config = {
        extra = {
			spadesdisplay = '',
			heartsdisplay = '',
			diamondsdisplay = '',
			clubsdisplay = '',
			nonedisplay = 'none',
            doesexist = 0,
            spadesindeck = 0,
            heartsindeck = 0,
            diamondsindeck = 0,
            clubsindeck = 0,
            xmult0 = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Cringe Horse',
        ['text'] = {
            [1] = 'If any single {C:attention}suit{} appears on less',
            [2] = 'cards than all other {C:attention}suits{} in your',
            [3] = '{C:attention}full deck{}, playing cards with that',
            [4] = '{C:attention}suit{} give {X:red,C:white}X1.25{} Mult when scored',
            [5] = '{C:inactive}(Currently{} {C:spades}#1#{}{C:hearts}#2#{}{C:diamonds}#3#{}{C:clubs}#4#{}{C:red}#5#{}{C:inactive}){}' --aagh i cant figure out this color changing stuff whatever
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.spadesdisplay, card.ability.extra.heartsdisplay, card.ability.extra.diamondsdisplay, card.ability.extra.clubsdisplay, card.ability.extra.nonedisplay, card.ability.extra.doesexist, localize((G.GAME.current_round.lowestsuit_card or {}).suit or 'Spades', 'suits_singular'), (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Spades' then count = count + 1 end end; return count end)(), (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Hearts' then count = count + 1 end end; return count end)(), (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Diamonds' then count = count + 1 end end; return count end)(), (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)()}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.lowestsuit_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
		
		local spadescount = to_big((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Spades' then count = count + 1 end end; return count end)())
		local heartscount = to_big((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Hearts' then count = count + 1 end end; return count end)())
		local diacount = to_big((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Diamonds' then count = count + 1 end end; return count end)())
		local clubscount = to_big((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.suit == 'Clubs' then count = count + 1 end end; return count end)())
		
        if (spadescount < heartscount and spadescount < diacount and spadescount < clubscount and spadescount ~= 0) then -- if the suit's not in the deck at all, don't count it as the lowest, since the player cant play it
            G.GAME.current_round.lowestsuit_card.suit = 'Spades'
            card.ability.extra.spadesdisplay = 'Spades'
			card.ability.extra.heartsdisplay = ''
			card.ability.extra.diamondsdisplay = ''
			card.ability.extra.clubsdisplay = ''
			card.ability.extra.nonedisplay = ''
            return {
                func = function()
                    card.ability.extra.doesexist = 1
                    return true
                end
            }
        elseif (heartscount < spadescount and heartscount < diacount and heartscount < clubscount and heartscount ~= 0) then
            G.GAME.current_round.lowestsuit_card.suit = 'Hearts'
            card.ability.extra.spadesdisplay = ''
			card.ability.extra.heartsdisplay = 'Hearts'
			card.ability.extra.diamondsdisplay = ''
			card.ability.extra.clubsdisplay = ''
			card.ability.extra.nonedisplay = ''
            return {
                func = function()
                    card.ability.extra.doesexist = 1
                    return true
                end
            }
        elseif (diacount < heartscount and diacount < spadescount and diacount < clubscount and diacount ~= 0) then
            G.GAME.current_round.lowestsuit_card.suit = 'Diamonds'
            card.ability.extra.spadesdisplay = ''
			card.ability.extra.heartsdisplay = ''
			card.ability.extra.diamondsdisplay = 'Diamonds'
			card.ability.extra.clubsdisplay = ''
			card.ability.extra.nonedisplay = ''
            return {
                func = function()
                    card.ability.extra.doesexist = 1
                    return true
                end
            }
        elseif (clubscount < heartscount and clubscount < diacount and clubscount < spadescount and clubscount ~= 0) then
            G.GAME.current_round.lowestsuit_card.suit = 'Clubs'
            card.ability.extra.spadesdisplay = ''
			card.ability.extra.heartsdisplay = ''
			card.ability.extra.diamondsdisplay = ''
			card.ability.extra.clubsdisplay = 'Clubs'
			card.ability.extra.nonedisplay = ''
            return {
                func = function()
                    card.ability.extra.doesexist = 1
                    return true
                end
            }
        else
            card.ability.extra.spadesdisplay = ''
			card.ability.extra.heartsdisplay = ''
			card.ability.extra.diamondsdisplay = ''
			card.ability.extra.clubsdisplay = ''
			card.ability.extra.nonedisplay = 'none'
            return {
                func = function()
                    card.ability.extra.doesexist = 0
                    return true
                end
            }
        end
		
    end
    if context.individual and context.cardarea == G.play  then
        if (to_big((card.ability.extra.doesexist or 0)) == to_big(1) and context.other_card:is_suit(G.GAME.current_round.lowestsuit_card.suit)) then
            return {
                Xmult = 1.25
            }
        end
    end
end
}