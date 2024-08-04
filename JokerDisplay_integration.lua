------------------------------
-- JokerDisplay Integration --
------------------------------

local jd_def = JokerDisplay.Definitions

jd_def["j_jank_fortuno"] = { -- Fortuno
    text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars" }
    },
    text_config = { colour = G.C.GOLD },
    calc_function = function(card)
        local dollars = 0
        local active = G.GAME and
            ((not next(G.play.cards) and G.GAME.current_round.hands_played < 1) or
                (next(G.play.cards) and G.GAME.current_round.hands_played <= 1))
        if active then
            local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
            local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if not (scoring_card:is_face() or scoring_card:get_id() == 14) then
                        dollars = dollars + card.ability.extra.dollars
                    end
                end
            end
        end
        card.joker_display_values.dollars = dollars
    end
}
jd_def["j_jank_stanczyk"] = { -- Stańczyk
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return not playing_card.debuff and playing_card.ability.set == 'Enhanced' and 1 or 0
    end
}
jd_def["j_jank_feste"] = { -- Feste
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "active_text" },
        { text = ')' },
    },
    calc_function = function(card)
        local active = G.GAME and G.GAME.current_round.hands_played == 0 and G.GAME.blind and G.GAME.blind.boss
        card.joker_display_values.active = active
        card.joker_display_values.active_text = card.joker_display_values.active and
            localize('k_active') or "Inactive"
    end,
}
jd_def["j_jank_jevil"] = { -- Jevil

}
jd_def["j_jank_midnight_crew"] = { -- Midnight Crew
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "localized_text_flush", colour = G.C.ORANGE },
        { text = '+' },
        { ref_table = "card.joker_display_values", ref_value = "localized_text_suit" },
        { text = ')' },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text_flush = localize('Flush', "poker_hands")
        card.joker_display_values.localized_text_suit = localize(card.ability.extra.suit or "Spades", 'suits_plural')
    end,
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[4] then
            reminder_text.children[4].config.colour = lighten(G.C.SUITS[card.ability.extra.suit or "Spades"], 0.35)
        end
        return false
    end
}
jd_def["j_jank_devilish"] = { -- Devilish Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    calc_function = function(card)
        local count = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        for _, played_card in pairs(hand) do
            if played_card:get_id() == 6 or played_card.ability.name == 'Gold Card' then
                count = count + 1
            else
                break
            end
        end
        card.joker_display_values.x_mult = count > 0 and count == #hand and card.ability.extra.x_mult or 1
    end,
}
jd_def["j_jank_impractical"] = { -- Impractical Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ')' },
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.x_mult = text == card.ability.extra.poker_hand and card.ability.extra.x_mult or 1
        card.joker_display_values.localized_text = localize(card.ability.extra.poker_hand or 'High Card', "poker_hands")
    end,
}
jd_def["j_jank_wanted_poster"] = { -- Wanted Poster
    text = {
        { ref_table = "card.joker_display_values", ref_value = "dollars" }
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        local active = G.GAME and
            ((not next(G.play.cards) and G.GAME.current_round.hands_played < 1) or
                (next(G.play.cards) and G.GAME.current_round.hands_played <= 1))
        card.joker_display_values.dollars = active and "+$" .. card.ability.extra.dollars or
            "-$" .. card.ability.extra.penalty
        card.joker_display_values.localized_text = "(" .. (localize(active and "k_round" or "k_hud_hands")) .. ")"
    end
}
jd_def["j_jank_sentai"] = { -- Sentai Joker
    text = {
        { text = '+' },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
    calc_function = function (card)
        -- This seems unintended
        card.joker_display_values.mult = card.ability.mult ~= 0 and card.ability.mult + card.ability.extra.mult or 0
    end
}
jd_def["j_jank_makeshift"] = { -- Makeshift Joker
    text = {
        { text = '+' },
        { ref_table = "card.ability", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
}
jd_def["j_jank_pitiful"] = { -- Pitiful Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text_high_card", colour = G.C.ORANGE },
        { text = "/" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text_pair",      colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)
        card.joker_display_values.mult = (text == "High Card" or text == "Pair") and card.ability.extra.mult or 0
        card.joker_display_values.localized_text_high_card = localize("High Card", 'poker_hands')
        card.joker_display_values.localized_text_pair = localize("Pair", 'poker_hands')
    end
}
jd_def["j_jank_ternary_system"] = { -- Ternary System
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "active_text" },
        { text = ')' },
    },
    calc_function = function(card)
        local text = ""
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        if #hand == 3 then
            text, _, _ = JokerDisplay.evaluate_hand(hand)
        end
        card.joker_display_values.active_text = text == card.ability.extra.poker_hand and localize('k_active') or
        "Inactive"
    end,
}
jd_def["j_jank_minimalist"] = { -- Minimalist Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
    calc_function = function(card)
        local has_face = false
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        for _, played_card in pairs(hand) do
            if played_card:is_face() then
                has_face = true
                break
            end
        end
        card.joker_display_values.mult = #hand > 0 and not has_face and card.ability.extra.mult or 0
    end
}
jd_def["j_jank_devoted"] = { -- Devoted Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_mult" }
            }
        }
    },
}
jd_def["j_jank_pawn"] = { -- Pawn Joker
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}
jd_def["j_jank_scrapper"] = { -- Scrapper Joker
    text = {
        { text = '+' },
        { ref_table = "card.joker_display_values", ref_value = "count" },
    },
    text_config = { colour = G.C.SECONDARY_SET.Planet },
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = " in " },
            { ref_table = "card.ability.extra",        ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        local count = 0
        local hand = G.hand.highlighted
        for _, playing_card in pairs(hand) do
            if playing_card.facing and not (playing_card.facing == 'back') and (playing_card:get_id() ~= 14 and not playing_card:is_face()) then
                count = count + 1
            end
        end
        card.joker_display_values.count = count >= 5 and 1 or 0
        card.joker_display_values.odds = G.GAME and G.GAME.probabilities.normal or 1
    end
}
jd_def["j_jank_old_man"] = { -- Old Man Joker

}
jd_def["j_jank_box_of_stuff"] = { -- Box of Stuff

}
jd_def["j_jank_expanded_art"] = { -- Expanded Art Joker
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card.ability.set == 'Enhanced' then
                    chips = chips +
                    card.ability.extra.chips * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = chips
    end
}
jd_def["j_jank_highlander"] = { -- Highlander Joker

}
jd_def["j_jank_lieutenant"] = { -- Lieutenant Joker

}
jd_def["j_jank_cut_the_cheese"] = { -- Cut the Cheese

}
jd_def["j_jank_shady_dealer"] = { -- Shady Dealer

}
jd_def["j_jank_suspicious_vase"] = { -- Suspicious Vase
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = '(2,3,4)' },
    },
    calc_function = function(card)
        local count = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if (scoring_card:get_id() == 2 or scoring_card:get_id() == 3 or scoring_card:get_id() == 4) and not (scoring_card.ability.name == 'Glass Card') then
                    count = count + 1
                end
            end
        end
        card.joker_display_values.x_mult = tonumber(string.format("%.2f", (card.ability.extra.x_mult ^ count)))
    end
}
jd_def["j_jank_mural_menace"] = { -- Mural Menace

}
jd_def["j_jank_chicken_scratch"] = { -- Chicken Scratch
    text = {
        { text = '+' },
        { ref_table = "card.ability.extra", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = {
        { text = '(8,7,3)' },
    }
}
jd_def["j_jank_chalk_outline"] = { -- Chalk Outline
    text = {
        { text = '+' },
        { ref_table = "card.ability.extra", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
}
jd_def["j_jank_boredom_slayer"] = { -- Boredom Slayer

}
jd_def["j_jank_cardslinger"] = { -- Cardslinger
    text = {
        { text = '+' },
        { ref_table = "card.joker_display_values", ref_value = "chips" }
    },
    text_config = { colour = G.C.CHIPS },
    calc_function = function(card)
        local chips = 0
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                chips = chips +
                card.ability.extra.chips * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.chips = chips
    end
}
jd_def["j_jank_sunday_funnies"] = { -- Sunday Funnies
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "remaining" },
        { text = ')' },
    },
    calc_function = function(card)
        card.joker_display_values.remaining = localize { type = 'variable', key = 'loyalty_inactive', vars = { card.ability.extra.counter } }
    end,
}
jd_def["j_jank_self_portrait"] = { -- Self Portrait
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_mult" }
            }
        }
    },
    reminder_text = {
        { text = '(' },
        { ref_table = "card.joker_display_values", ref_value = "condition", colour = G.C.ORANGE },
        { text = ')' },
    },
    calc_function = function(card)
        local conditions = {
            localize("k_tarot"),
            localize("k_planet"),
            "Destroy Card",
            "Hand < 3",
            "Discard >3 Face",
            localize('High Card', "poker_hands"),
            localize('Straight', "poker_hands"),
            localize('Flush', "poker_hands"),
        }
        card.joker_display_values.condition = conditions[card.ability.extra.ability_state] or "-"
    end,
}
jd_def["j_jank_memorable"] = { -- Memorable Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "x_mult" }
            }
        }
    },
}
jd_def["j_jank_tapestry"] = { -- Tapestry Joker
    text = {
        { text = '+' },
        { ref_table = "card.ability.extra", ref_value = "mult" }
    },
    text_config = { colour = G.C.MULT },
}
jd_def["j_jank_sir"] = { -- Sir Joker
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult" }
            }
        }
    },
    calc_function = function(card)
        local active = G.GAME and G.GAME.current_round.hands_left <= 1 or G.GAME.blind and G.GAME.blind.boss
        card.joker_display_values.x_mult = active and card.ability.extra.x_mult or 1
    end,
}
