
SMODS.Joker{ --The Child of Void
    key = "thechildofvoid",
    config = {
        extra = {
            chips = 0,
            mult = 0,
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'The Child of Void',
        ['text'] = {
            [1] = 'When a card with an {C:dark_edition}Edition{} is played,',
            [2] = 'add half its effects to this Joker',
            [3] = '(Currently: {C:blue}+#1#{}{C:inactive} Chips, {}{C:red}+#2#{}{C:inactive} Mult, {}{X:red,C:white}x#3#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["horse_horse_legendaries"] = true },
    soul_pos = {
        x = 1,
        y = 5
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.edition and context.other_card.edition.key == "e_foil" then
                card.ability.extra.chips = (card.ability.extra.chips) + 25
				return {
                    message = "Foiled!"
                }
            elseif context.other_card.edition and context.other_card.edition.key == "e_holo" then
                card.ability.extra.mult = (card.ability.extra.mult) + 5
				return {
                    message = "Holo\'d!"
                }
            elseif context.other_card.edition and context.other_card.edition.key == "e_polychrome" then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.25
				return {
                    message = "Poly\'d!"
                }
            end
        end
		if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.chips,
                extra = {
                    mult = card.ability.extra.mult,
                    extra = {
                        Xmult = card.ability.extra.xmult
                    }
                }
            }
        end
    end
}