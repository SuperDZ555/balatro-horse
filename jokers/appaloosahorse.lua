
SMODS.Joker{ --Appaloosa Horse
    key = "appaloosahorse",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Appaloosa Horse',
        ['text'] = {
            [1] = 'All cards of {C:attention}#1#{} suit',
            [2] = 'count as all suits',
            [3] = '{C:inactive}(Suit changes at end of round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_jokers"] = true, ["horse_common_horses"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.suit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.suit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.suit_card = { suit = 'Spades' }
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.playing_cards then
                local valid_suit_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_suit_cards[#valid_suit_cards + 1] = v
                    end
                end
                if valid_suit_cards[1] then
                    local suit_card = pseudorandom_element(valid_suit_cards, pseudoseed('suit' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.suit_card.suit = suit_card.base.suit
                end
            end
            return {
                message = "Reset"
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Combine suits effect enabled
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Combine suits effect disabled
    end
	
	-- yknow im starting to think jokerforge was vibecoded because what the fuck do these even do
}


local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if not ret and not SMODS.has_no_suit(self) then
        if next(SMODS.find_card("j_horse_appaloosahorse")) then
            -- If card is Y, return true
            if self.base.suit == G.GAME.current_round.suit_card.suit then
                ret = true
            end
        end
    end
    return ret
end