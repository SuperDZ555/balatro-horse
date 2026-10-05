
SMODS.Joker{ --Horze
    key = "horze",
    config = {
        extra = {
            isitleast = 1,
            highcardlevel = 0,
            pairlevel = 0,
            twopairlevel = 0,
            threeofakindlevel = 0,
            straightlevel = 0,
            flushlevel = 0,
            fullhouselevel = 0,
            fourofakindlevel = 0,
            straightflushlevel = 0,
            fiveofakindplayed = 0,
            fiveofakindlevel = 0,
            flushhouseplayed = 0,
            flushhouselevel = 0,
            flushfivelevel = 0,
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Horze',
        ['text'] = {
            [1] = 'Upgrade level of played {C:attention}poker hand{}',
            [2] = 'if it is the lowest level',
            [3] = 'of all of your {C:attention}poker hands{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.isitleast, (G.GAME.hands['High Card'].level or 0), (G.GAME.hands['Pair'].level or 0), (G.GAME.hands['Two Pair'].level or 0), (G.GAME.hands['Three of a Kind'].level or 0), (G.GAME.hands['Straight'].level or 0), (G.GAME.hands['Flush'].level or 0), (G.GAME.hands['Full House'].level or 0), (G.GAME.hands['Four of a Kind'].level or 0), (G.GAME.hands['Straight Flush'].level or 0), (G.GAME.hands['Five of a Kind'].played or 0), (G.GAME.hands['Five of a Kind'].level or 0), (G.GAME.hands['Flush House'].played or 0), (G.GAME.hands['Flush House'].level or 0), (G.GAME.hands['Flush Five'].level or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if ((function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['High Card'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Pair'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Two Pair'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Three of a Kind'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Straight'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Flush'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Full House'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Four of a Kind'].level) then
                        return true
                    end
                end
                return false
            end)() or (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Straight Flush'].level) then
                        return true
                    end
                end
                return false
            end)()) then
                return {
                    func = function()
                        card.ability.extra.isitleast = 0
                        return true
                    end
                }
            elseif ((to_big(G.GAME.hands['Five of a Kind'].played) > to_big(0) and (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Five of a Kind'].level) then
                        return true
                    end
                end
                return false
            end)())) and ((to_big(G.GAME.hands['Flush House'].played) > to_big(0) and (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Flush House'].level) then
                        return true
                    end
                end
                return false
            end)())) and ((to_big(G.GAME.hands['Five of a Kind'].played) > to_big(0) and (function()
                for hand, data in pairs(G.GAME.hands) do
                    if hand == context.scoring_name and to_big(data.level) > to_big(G.GAME.hands['Flush Five'].level) then
                        return true
                    end
                end
                return false
            end)())) then
                return {
                    func = function()
                        card.ability.extra.isitleast = (card.ability.extra.isitleast) + 0
                        return true
                    end
                }
            elseif to_big((card.ability.extra.isitleast or 0)) == to_big(1) then
                local target_hand = (context.scoring_name or "High Card")
                level_up_hand(card, target_hand, true, 1)
                return {
                    message = localize('k_level_up_ex')
                }
            else
                return {
                    func = function()
                        card.ability.extra.isitleast = 1
                        return true
                    end
                }
            end
        end
    end
}