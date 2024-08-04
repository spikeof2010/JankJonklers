--- STEAMODDED HEADER
--- MOD_NAME: JankJonklersMod
--- MOD_ID: JankJonklersMod
--- PREFIX: jank
--- MOD_AUTHOR: [Lyman]
--- MOD_DESCRIPTION: Adds a bunch of Jank Jonklers.
--- BADGE_COLOUR: 66AB05
--- DISPLAY_NAME: Jank Jonklers

----------------------------------------------
------------MOD CODE -------------------------

--add mind mage after you rework it, dummy!
-- jevil does nothing! yet
local config = {
    j_jank_fortuno = true,
    j_jank_stanczyk = true,
    j_jank_feste = true,
    j_jank_jevil = false,
    j_jank_midnight_crew = true,
    j_jank_sir = true,
    j_jank_devilish = true,
    j_jank_impractical = true,
    j_jank_wanted_poster = true,
    j_jank_sentai = true,
    j_jank_makeshift = true,
    j_jank_pitiful = true,
    j_jank_ternary_system = true,
    j_jank_minimalist = true,
    j_jank_devoted = true,
    j_jank_pawn = true,
    j_jank_scrapper = true,
    j_jank_old_man = true,
    j_jank_box_of_stuff = true,
    j_jank_expanded_art = true,
    j_jank_highlander = true,
    j_jank_lieutenant = true,
    j_jank_cut_the_cheese = true,
    j_jank_shady_dealer = true,
    j_jank_suspicious_vase = true,
    j_jank_mural_menace = true,
    j_jank_chicken_scratch = true,
    j_jank_chalk_outline = true,
    j_jank_boredom_slayer = true,
    j_jank_cardslinger = true,
    j_jank_sunday_funnies = true,
    j_jank_self_portrait = true,
    j_jank_memorable = true,
    j_jank_tapestry = true,
}
SMODS.Atlas({
    key = "JankJonklers",
    atlas_table = "ASSET_ATLAS", 
    path = "spritesheet.png",
    px = 71,
    py = 95,
})

-- thank you mika for this code!!!
local function init_joker(joker, no_sprite)
    no_sprite = no_sprite or false

    joker.atlas = "JankJonklers"
    local joker = SMODS.Joker(joker)
end

local function get_suit(card)
    if (card.ability.effect == 'Stone Card' or card.config.center.no_rank) and not card.vampired then
        return -math.random(100, 100000)
    end
    return card.base.suit
end

-- Fortuno
if config.j_jank_fortuno then
    local fortuno = {
        key = "fortuno",
        config = {
            extra = {
                dollars = 3,
                trash_list = {}
            },
        },
        rarity = 4,
        cost = 20,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = true,
        pos = { x = 5, y = 3 },
        soul_pos = { x = 0, y = 4 }
    }
   
    -- Set local variables
    function fortuno.loc_vars(self, info, card)
        return { vars = { card.ability.extra.dollars } }
    end

    -- Calculate
    fortuno.calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint and G.GAME.current_round.hands_played == 0 then
            for k, v in ipairs(context.scoring_hand) do
                if not (v:is_face() or v:get_id() == 14) then
                    table.insert(card.ability.extra.trash_list, v)
                    local card_to_destroy = v
                    card_to_destroy.getting_sliced = true
                    card_to_destroy:start_dissolve()
                    ease_dollars(card.ability.extra.dollars)
                end
            end
            return {
                message = localize('$') .. card.ability.extra.dollars,
                colour = G.C.MONEY,
                delay = 0.45,
                remove = true,
                card = card
            }
        elseif context.end_of_round then
            if not context.blueprint and not context.repetition then
                for i = 1, #card.ability.extra.trash_list do
                    card.ability.extra.trash_list[i]:start_dissolve(nil, true, 0, true)
                end
                card.ability.extra.trash_list = {}
            end
        end
    end

    -- Initialize Joker
    init_joker(fortuno)
end

-- Stańczyk
if config.j_jank_stanczyk then
    local stanczyk = {
        key = "stanczyk",
        config = {
            extra = {
                loop_amount = 1,
            },
        },
        rarity = 4,
        cost = 20,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 7, y = 3 },
        soul_pos = { x = 2, y = 4 }
    }
    
    -- Set local variables
    function stanczyk.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.loop_amount } }
    end

    -- Calculate
    stanczyk.calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card.ability.set == 'Enhanced' and not context.other_card.debuff then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
        if context.repetition and context.cardarea == G.hand then
            if context.other_card.ability.set == 'Enhanced' and (next(context.card_effects[1]) or #context.card_effects > 1) and not context.other_card.debuff then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(stanczyk)
end

-- Feste
if config.j_jank_feste then
    local feste = {
        key = "feste",
        config = {
            extra = 4,
        },
        rarity = 4,
        cost = 20,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 4, y = 3 },
        soul_pos = { x = 9, y = 3 }
    }
    
    -- Set local variables
    function feste.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra } }
    end

    -- Calculate
    feste.calculate = function(self, card, context)
        if context.before then
            if G.GAME.current_round.hands_played == 0 and G.GAME.blind.boss then
                level_up_hand(card, context.scoring_name, false, card.ability.extra)
                return {
                    card = card,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(feste)
end

-- Jevil
if config.j_jank_jevil then
    local jevil = {
        key = "jevil",
        config = {
            extra = 4,
        },
        rarity = 4,
        cost = 20,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 6, y = 3 },
        soul_pos = { x = 1, y = 4 }
    }
    
    -- Set local variables
    function jevil.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra } }
    end

    -- Calculate
    jevil.calculate = function(self, card, context)
        if context.before then
            if G.GAME.current_round.hands_played == 0 and G.GAME.blind.boss then
                level_up_hand(card, context.scoring_name, false, card.ability.extra)
                return {
                    card = card,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(jevil)
end

-- Midnight Crew
if config.j_jank_midnight_crew then
    local midnight_crew = {
        key = "midnight_crew",
        config = {
            extra = {
                suit = "Spades",
                x_mult = 1,
            },
        },
        rarity = 4,
        cost = 20,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 8, y = 3 },
        soul_pos = { x = 3, y = 4 }
    }
    
    -- Set local variables
    function midnight_crew.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.suit, card.ability.extra.x_mult, colours = { G.C.SUITS[card.ability.extra.suit] } } }
    end

    -- Calculate
    midnight_crew.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == "Flush" or context.scoring_name == "Straight Flush" or context.scoring_name == "Royal Flush" or context.scoring_name == "Flush Five" or context.scoring_name == "Flush House" then
                local isFlushSuit = true
                for k, v in ipairs(context.full_hand) do
                    isFlushSuit = isFlushSuit and get_suit(v) == card.ability.extra.suit
                end
                if isFlushSuit then
                    if not context.blueprint then
                        card.ability.extra.x_mult = card.ability.extra.x_mult + 0.5
                    end
                    return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                        Xmult_mod = card.ability.extra.x_mult
                    }
                end
            end
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                Xmult_mod = card.ability.extra.x_mult
            }
        end
        if context.end_of_round and not context.blueprint and not (context.individual or context.repetition) then
            local midnight_suits = { "Spades", "Diamonds", "Hearts", "Clubs" }
            local midnight_picker = pseudorandom_element({ 1, 2, 3, 4 }, pseudoseed('midnight_crew'))
            card.ability.extra.suit = midnight_suits[midnight_picker]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    midnight_crew.soul_pos.x = midnight_picker + 2
                    card:set_sprites(card.config.center)
                    return true
                end
            }))
        end
    end

    -- Initialize Joker
    init_joker(midnight_crew)
end

-- Devilish Joker
if config.j_jank_devilish then
    -- Create Joker
    local devilish = {
        key = "devilish",
        config = {
            extra = {
                x_mult = 3
            }
        },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 9, y = 0 },
    }
    
    -- Set local variables
    function devilish.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end

    -- Calculate
    devilish.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            local onlySixes = true
            for k, v in ipairs(context.full_hand) do
                onlySixes = onlySixes and (v:get_id() == 6 or v.ability.name == 'Gold Card')
            end
            if not onlySixes then
                return nil
            end
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end

    -- Initialize Joker
    init_joker(devilish)
end

-- Impractical Joker
if config.j_jank_impractical then
    -- Create Joker
    local impractical = {
        key = "impractical",
        config = {
            extra = {
                x_mult = 3,
                poker_hand = "High Card",
            }
        },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 3, y = 1 },
    }
    
    -- Set local variables
    function impractical.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.poker_hand, card.ability.extra.x_mult } }
    end

    -- Calculate
    impractical.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == card.ability.extra.poker_hand then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible and k ~= card.ability.to_do_poker_hand then _poker_hands[#_poker_hands + 1] = k end
                        end
                        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('to_do'))
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    Xmult_mod = card.ability.extra.x_mult
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(impractical)
end

-- Impractical Joker
if config.j_jank_wanted_poster then
    -- Create Joker
    local wanted_poster = {
        key = "wanted_poster",
        config = {
            extra = {
                dollars = 10,
                penalty = 2,
            }
        },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 3, y = 3 },
    }
    
    -- Set local variables
    function wanted_poster.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.penalty } }
    end

    -- Calculate
    wanted_poster.calculate = function(self, card, context)
        if context.cardarea == G.jokers then
            if context.before then
                if G.GAME.current_round.hands_played >= 1 then
                    ease_dollars(-card.ability.extra.penalty)
                    return {
                        message = '-' .. localize('$') .. card.ability.extra.penalty,
                        colour = G.C.MONEY,
                        delay = 0.45,
                        remove = true,
                        card = card
                    }
                end
            end
        end
    end

    wanted_poster.calc_dollar_bonus = function(self, card)
		if G.GAME.current_round.hands_played == 1 then
            return card.ability.extra.dollars
        end
	end

    -- Initialize Joker
    init_joker(wanted_poster)
end

-- Sentai Joker
if config.j_jank_sentai then
    -- Create Joker
    local sentai = {
        key = "sentai",
        config = {
            extra = {
                mult = 8
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 4, y = 2 },
    }
    
    -- Set local variables
    function sentai.loc_vars(self, info_queue, card)
        return { vars = { card.ability.mult, card.ability.extra.mult } }
    end

    -- Calculate
    sentai.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and card.ability.mult > 0 then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } },
                mult_mod = card.ability.mult + card.ability.extra.mult
            }
        elseif context.using_consumeable then
            if not context.blueprint and context.consumeable.ability.set == 'Planet' then
                card.ability.mult = card.ability.mult + card.ability.extra.mult
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } } }); return true
                    end
                }))
                return
            end
        elseif context.end_of_round and not context.blueprint then
            if G.GAME.blind.boss and card.ability.mult > 1 then
                card.ability.mult = 0
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(sentai)
end


-- Makeshift Joker
if config.j_jank_makeshift then
    -- Create Joker
    local makeshift = {
        key = "makeshift",
        config = {
            extra = {
                mult = 1
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 5, y = 1 },
    }
    
    -- Set local variables
    function makeshift.loc_vars(self, info_queue, card)
        return { vars = { card.ability.mult, card.ability.extra.mult } }
    end

    -- Calculate
    makeshift.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and card.ability.mult > 0 then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } },
                mult_mod = card.ability.mult
            }
        elseif context.selling_card then
            if not context.blueprint then
                card.ability.mult = card.ability.mult + card.ability.extra.mult
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.mult } } }); return true
                    end
                }))
                return
            end
        end
    end

    -- Initialize Joker
    init_joker(makeshift)
end


-- Pitiful Joker
if config.j_jank_pitiful then
    -- Create Joker
    local pitiful = {
        key = "pitiful",
        config = {
            extra = {
                mult = 10
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 2, y = 2 },
    }
    
    -- Set local variables
    function pitiful.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end

    -- Calculate
    pitiful.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and (context.scoring_name == "High Card" or context.scoring_name == "Pair") then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult_mod = card.ability.extra.mult
            }
        end
    end

    -- Initialize Joker
    init_joker(pitiful)
end

-- Ternary System
if config.j_jank_ternary_system then
    -- Create Joker
    local ternary_system = {
        key = "ternary_system",
        config = {
            extra = {
                poker_hand = 'Three of a Kind'
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 0, y = 3 },
    }
    
    -- Set local variables
    function ternary_system.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.poker_hand } }
    end

    -- Calculate
    ternary_system.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if #context.full_hand == 3 then
                    if next(context.poker_hands[card.ability.extra.poker_hand]) then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, '8ba')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end)
                        }))
                        return {
                            message = localize('k_plus_planet'),
                            colour = G.C.SECONDARY_SET.Planet,
                            card = card
                        }
                    end
                end
                return nil
            end
        end
    end

    -- Initialize Joker
    init_joker(ternary_system)
end

-- Minimalist Joker
if config.j_jank_minimalist then
    -- Create Joker
    local minimalist = {
        key = "minimalist",
        config = {
            extra = {
                mult = 10
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 8, y = 1 },
    }
    
    -- Set local variables
    function minimalist.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end

    -- Calculate
    minimalist.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            local CheckForFaces = true
            for k, v in ipairs(context.full_hand) do
                CheckForFaces = CheckForFaces and not v:is_face()
            end
            if not CheckForFaces then
                return nil
            end
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult_mod = card.ability.extra.mult
            }
        end
    end

    -- Initialize Joker
    init_joker(minimalist)
end

-- Devoted Joker
if config.j_jank_devoted then
    -- Create Joker
    local devoted = {
        key = "devoted",
        config = {
            extra = {
                x_mult = 1,
                x_mult_gain = 0.5
            }
        },
        rarity = 3,
        cost = 8,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 0, y = 1 },
    }
    
    -- Set local variables
    function devoted.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
    end

    -- Calculate
    devoted.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if card.ability.extra.x_mult > 1 then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    Xmult_mod = card.ability.extra.x_mult
                }
            end
        elseif context.setting_blind and not card.getting_sliced then
            if not context.blueprint and context.blind.boss and not card.getting_sliced then
                ease_dollars(-G.GAME.dollars, true)
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(devoted)
end

-- Pawn Joker
if config.j_jank_pawn then
    -- Create Joker
    local pawn = {
        key = "pawn",
        config = {
            extra = {
                odds = 2,
                dollars = 3
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 1, y = 2 },
    }
    
    -- Set local variables
    function pawn.loc_vars(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.dollars } }
    end

    -- Calculate
    pawn.calculate = function(self, card, context)
        if context.selling_card then
            if pseudorandom('pawn_broker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                ease_dollars(card.ability.extra.dollars)
                return {
                    message = localize('$') .. card.ability.extra.dollars,
                    colour = G.C.MONEY,
                    delay = 0.45,
                    card = card
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(pawn)
end

-- Scrapper Joker
if config.j_jank_scrapper then
    -- Create Joker
    local scrapper = {
        key = "scrapper",
        config = {
            extra = {
                odds = 3
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true
    }
    
    -- Set local variables
    function scrapper.loc_vars(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end

    -- Calculate
    scrapper.calculate = function(self, card, context)
        if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local numbered_cards = 0
            for k, v in ipairs(context.full_hand) do
                if (v:get_id() ~= 14 and not v:is_face()) then numbered_cards = numbered_cards + 1 end
            end
            if numbered_cards >= 5 and pseudorandom('scrapper') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, '8ba')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_planet'),
                    colour = G.C.SECONDARY_SET.Planet,
                    card = card
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(scrapper)
end

-- Old Man Joker
if config.j_jank_old_man then
    -- Create Joker
    local old_man = {
        key = "old_man",
        config = {
            extra = {
            }
        },
        rarity = 2,
        cost = 6,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = true,
        pos = { x = 0, y = 2 },
    }

    -- Set local variables
    function old_man.loc_vars(self, info_queue, card)
        return {}
    end

    -- Calculate
    old_man.calculate = function(self, card, context)
        if context.setting_blind and not card.getting_sliced then
            if not context.blueprint and context.blind.boss then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_ethereal'))
                        play_sound('generic1', 0.6 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.1 + math.random() * 0.1, 0.4)
                        return true
                    end)
                }))
            end
        end
    end

    -- Initialize Joker
    init_joker(old_man)
end


-- Box of Stuff
if config.j_jank_box_of_stuff then
    -- Create Joker
    local box_of_stuff = {
        key = "box_of_stuff",
        config = {
            extra = {
            }
        },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false,
        pos = { x = 3, y = 0 },
    }
    
    -- Set local variables
    function box_of_stuff.loc_vars(self, info_queue, card)
        return {}
    end

    -- Calculate
    box_of_stuff.calculate = function(self, card, context)
        if context.setting_blind and not card.getting_sliced then
            if not context.blueprint and context.blind.boss then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_standard'))
                        add_tag(Tag('tag_standard'))
                        add_tag(Tag('tag_standard'))
                        play_sound('generic1', 0.6 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.1 + math.random() * 0.1, 0.4)
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                                return true;
                            end
                        }))
                        return true
                    end)
                }))
            end
        end
    end

    -- Initialize Joker
    init_joker(box_of_stuff)
end

-- Expanded Art Joker
if config.j_jank_expanded_art then
    -- Create Joker
    local expanded_art = {
        key = "expanded_art",
        config = {
            extra = {
                chips = 30
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 1, y = 1 },
    }
    
    -- Set local variables
    function expanded_art.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end

    -- Calculate
    expanded_art.calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.ability.set == 'Enhanced' then
            return {
                chips = card.ability.extra.chips,
                colour = G.C.RED,
                card = card
            }
        end
    end

    -- Initialize Joker
    init_joker(expanded_art)
end

-- Highlander Joker
if config.j_jank_highlander then
    -- Create Joker
    local highlander = {
        key = "highlander",
        config = {
            extra = {
                chip_bonus = 20
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 2, y = 1 },
    }
    
    -- Set local variables
    function highlander.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.chip_bonus } }
    end

    -- Calculate
    highlander.calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.scoring_name == "High Card" then
                if not context.other_card.debuff then
                    context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                    context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus +
                    card.ability.extra.chip_bonus
                    return {
                        chip_bonus = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
    end

    -- Initialize Joker
    init_joker(highlander)
end

-- Lieutenant Joker
if config.j_jank_lieutenant then
    -- Create Joker
    local lieutenant = {
        key = "lieutenant",
        config = {
            extra = {
            }
        },
        rarity = 3,
        cost = 8,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 4, y = 1 },
    }
    
    -- Set local variables
    function lieutenant.loc_vars(self, info_queue, card)
        return {}
    end

    -- Calculate
    lieutenant.calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.scoring_name == "High Card" then
                for k, v in ipairs(context.full_hand) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            local card = v
                            local suit_prefix = string.sub(card.base.suit, 1, 1) .. '_'
                            local rank_suffix = card.base.id == 14 and 2 or math.min(card.base.id + 1, 14)
                            if rank_suffix < 10 then
                                rank_suffix = tostring(rank_suffix)
                            elseif rank_suffix == 10 then
                                rank_suffix = 'T'
                            elseif rank_suffix == 11 then
                                rank_suffix = 'J'
                            elseif rank_suffix == 12 then
                                rank_suffix = 'Q'
                            elseif rank_suffix == 13 then
                                rank_suffix = 'K'
                            elseif rank_suffix == 14 then
                                rank_suffix = 'A'
                            end
                            card:set_base(G.P_CARDS[suit_prefix .. rank_suffix])
                            return true
                        end
                    }))
                end
            end
        end
    end

    -- Initialize Joker
    init_joker(lieutenant)
end

-- Cut the Cheese
if config.j_jank_cut_the_cheese then
    -- Create Joker
    local cut_the_cheese = {
        key = "cut_the_cheese",
        config = {
            extra = {
            }
        },
        rarity = 3,
        cost = 8,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 8, y = 0 },
    }
    
    -- Set local variables
    function cut_the_cheese.loc_vars(self, info_queue, card)
        return {}
    end

    -- Calculate
    cut_the_cheese.calculate = function(self, card, context)
        if context.setting_blind then
            if not (context.blueprint_card or self).getting_sliced and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                local food_list = {
                    "j_popcorn",
                    "j_gros_michel",
                    "j_ice_cream",
                    "j_turtle_bean",
                    "j_ramen",
                    "j_selzer",
                    "j_diet_cola"
                }
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local chosen_joker = pseudorandom_element(food_list, pseudoseed('ctc'))
                        local card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen_joker, nil)
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil,
                    { message = localize('k_plus_joker'), colour = G.C.BLUE })
            end
        end
    end

    -- Initialize Joker
    init_joker(cut_the_cheese)
end


-- Shady Dealer
if config.j_jank_shady_dealer then
    -- Create Joker
    local shady_dealer = {
        key = "shady_dealer",
        config = {
            extra = {
            }
        },
        rarity = 3,
        cost = 10,
        unlocked = true,
        discovered = true,
        blueprint_compat = false,
        eternal_compat = false,
        pos = { x = 5, y = 2 },
    }
    
    -- Set local variables
    function shady_dealer.loc_vars(self, info_queue, card)
        return {}
    end

    -- Calculate
    shady_dealer.calculate = function(self, card, context)
        if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_negative'))
                    play_sound('generic1', 0.6 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.1 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
        end
    end

    -- Initialize Joker
    init_joker(shady_dealer)
end

-- Suspicious Vase
if config.j_jank_suspicious_vase then
    -- Create Joker
    local suspicious_vase = {
        key = "suspicious_vase",
        config = {
            extra = {
                x_mult = 2
            }
        },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 8, y = 2 },
    }
    
    -- Set local variables
    function suspicious_vase.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end

    -- Calculate
    suspicious_vase.calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4) then
                if context.other_card.ability.name == 'Glass Card' then
                    return nil
                end
                context.other_card:set_ability(G.P_CENTERS.m_glass, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_card:juice_up()
                        return true
                    end
                }))
                return {
                    x_mult = card.ability.extra.x_mult,
                    card = card
                }
            end
        end
    end

    -- Initialize Joker
    init_joker(suspicious_vase)
end

-- Mural Menace
if config.j_jank_mural_menace then
    -- Create Joker
    local mural_menace = {
        key = "mural_menace",
        config = {
            extra = {
            }
        },
        rarity = 2,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 9, y = 1 },
    }
    
    -- Set local variables
    function mural_menace.loc_vars(self, info_queue, card)
        return {}
    end

    -- Calculate
    mural_menace.calculate = function(self, card, context)
        if context.skip_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.FORCE_TAG then return G.FORCE_TAG end
                    local i = 1
                    while i <= 1 do
                        local _pool, _pool_key = get_current_pool('Tag', nil, nil, nil)
                        local _tag_name = pseudorandom_element(_pool, pseudoseed(_pool_key))
                        local it = 1
                        while _tag_name == 'UNAVAILABLE' or _tag_name == "tag_double" or _tag_name == "tag_orbital" do
                            it = it + 1
                            _tag_name = pseudorandom_element(_pool, pseudoseed(_pool_key .. '_resample' .. it))
                        end

                        G.GAME.round_resets.blind_tags = G.GAME.round_resets.blind_tags or {}
                        local _tag = Tag(_tag_name, nil, G.GAME.blind)
                        add_tag(_tag)
                        i = i + 1
                    end
                    return true
                end
            }))
        end
    end

    -- Initialize Joker
    init_joker(mural_menace)
end


-- Chicken Scratch
if config.j_jank_chicken_scratch then
    -- Create Joker
    local chicken_scratch = {
        key = "chicken_scratch",
        config = {
            extra = {
                chips = 0,
                chips_gain = 5
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 6, y = 0 },
    }
    
    -- Set local variables
    function chicken_scratch.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
    end

    -- Calculate
    chicken_scratch.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            local chickenfood = false
            for k, v in ipairs(context.scoring_hand) do
                if (v:get_id() == 8 or v:get_id() == 7 or v:get_id() == 3) then
                    chickenfood = true
                end
            end
            if not chickenfood then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    chip_mod = card.ability.extra.chips,
                    colour = G.C.CHIPS
                }
            end
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                end
            }))
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                chip_mod = card.ability.extra.chips,
                colour = G.C.CHIPS
            }
        end
    end

    -- Initialize Joker
    init_joker(chicken_scratch)
end

-- Chalk Outline
if config.j_jank_chalk_outline then
    -- Create Joker
    local chalk_outline = {
        key = "chalk_outline",
        config = {
            extra = {
                mult = 0,
                mult_gain = 6
            }
        },
        rarity = 1,
        cost = 5,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 5, y = 0 },
    }
    
    -- Set local variables
    function chalk_outline.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end

    -- Calculate
    chalk_outline.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if G.GAME.current_round.hands_left == 0 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
            end
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult_mod = card.ability.extra.mult
            }
        end
    end

    -- Initialize Joker
    init_joker(chalk_outline)
end


-- Boredom Slayer
if config.j_jank_boredom_slayer then
    -- Create Joker
    local boredom_slayer = {
        key = "boredom_slayer",
        config = {
            extra = {
                reduction = 0.9
            }
        },
        rarity = 3,
        cost = 8,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 2, y = 0 },
    }
    
    -- Set local variables
    function boredom_slayer.loc_vars(self, info_queue, card)
        return { vars = { (1 - card.ability.extra.reduction) * 100 } }
    end

    -- Calculate
    boredom_slayer.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local chips = G.GAME.blind.chips * 0.9
                    if type(chips) == 'table' then chips:floor() else chips = math.floor(chips) end

                    G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.9)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

                    local chips_UI = G.hand_text_area.blind_chips
                    G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                    G.HUD_blind:recalculate()
                    chips_UI:juice_up()

                    if not silent then play_sound('chips2') end
                    return true
                end
            }))
        end
    end

    -- Initialize Joker
    init_joker(boredom_slayer)
end

-- Cardslinger
if config.j_jank_cardslinger then
    -- Create Joker
    local cardslinger = {
        key = "cardslinger",
        config = {
            extra = {
                trigger_count = 0,
                chips = 10,
                clear_cache = false,
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 4, y = 0 },
    }
    
    -- Set local variables
    function cardslinger.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end

    -- Calculate
    cardslinger.calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if card.ability.extra.clear_cache then
                card.ability.extra.trigger_count = 0
                card.ability.extra.clear_cache = false
            end
            card.ability.extra.trigger_count = card.ability.extra.trigger_count + 1
        end
        if context.joker_main and context.cardarea == G.jokers then
            card.ability.extra.clear_cache = true
            card.ability.extra.chips = 10 * card.ability.extra.trigger_count
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                chip_mod = card.ability.extra.chips,
                colour = G.C.CHIPS
            }
        end
    end

    -- Initialize Joker
    init_joker(cardslinger)
end

-- Sunday Funnies
if config.j_jank_sunday_funnies then
    -- Create Joker
    local sunday_funnies = {
        key = "sunday_funnies",
        config = {
            extra = {
                counter = 2
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 7, y = 2 },
    }
    
    -- Set local variables
    function sunday_funnies.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.counter } }
    end

    -- Calculate
    sunday_funnies.calculate = function(self, card, context)
        if context.reroll_shop and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if card.ability.extra.counter == 1 then
                local tarot_or_planet = pseudorandom_element({ 1, 2 }, pseudoseed('sunday_funnies'))
                if tarot_or_planet == 1 then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'car')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil,
                                { message = localize('k_plus_tarot'), colour = G.C.PURPLE })
                            return true
                        end)
                    }))
                end
                if tarot_or_planet == 2 then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, '8ba')
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil,
                                { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet })
                            return true
                        end)
                    }))
                end
                card.ability.extra.counter = 2
            else
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                card.ability.extra.counter = card.ability.extra.counter - 1
            end
        end
    end

    -- Initialize Joker
    init_joker(sunday_funnies)
end

-- Self Portrait
if config.j_jank_self_portrait then
    -- Create Joker
    local self_portrait = {
        key = "self_portrait",
        config = {
            extra = {
                ability_loc_txt =  "use a Tarot card",
                ability_state = 1,
                x_mult = 1
            }
        },
        rarity = 3,
        cost = 8,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 3, y = 2 },
    }
    
    -- Set local variables
    function self_portrait.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.ability_loc_txt, card.ability.extra.x_mult } }
    end

    -- Calculate
    self_portrait.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.x_mult > 1 then
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                Xmult_mod = card.ability.extra.x_mult
            }
        elseif context.using_consumeable then
            if not context.blueprint and context.consumeable.ability.set == 'Tarot' and card.ability.extra.ability_state == 1 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
                return
            elseif not context.blueprint and context.consumeable.ability.set == 'Planet' and card.ability.extra.ability_state == 2 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
                return
            end
        elseif not context.blueprint and context.cards_destroyed and card.ability.extra.ability_state == 3 then
            card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                end
            }))
            return
        elseif not context.blueprint and context.cardarea == G.jokers and card.ability.extra.ability_state == 4 and context.full_hand and #context.full_hand <= 3 then
            card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                end
            }))
            return
        elseif not context.blueprint and context.discard and card.ability.extra.ability_state == 5 then
            local face_cards = 0
            for k, v in ipairs(context.full_hand) do
                if v:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= 3 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
                return
            end
        elseif not context.blueprint and context.cardarea == G.jokers and context.before then
            if card.ability.extra.ability_state == 6 and next(context.poker_hands['High Card']) then
                card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
                return
            elseif card.ability.extra.ability_state == 7 and next(context.poker_hands['Straight']) then
                card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
                return
            elseif card.ability.extra.ability_state == 8 and next(context.poker_hands['Flush']) then
                card.ability.extra.x_mult = card.ability.extra.x_mult + 0.1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                    end
                }))
                return
            end
        elseif context.setting_blind and not card.getting_sliced then
            if not context.blueprint and not card.getting_sliced then
                card.ability.extra.ability_state = pseudorandom_element({ 1, 2, 3, 4, 5, 6, 7, 8 },
                    pseudoseed('self_insert'))
                card.ability.extra.ability_loc_txt =  localize("self_portrait"..card.ability.extra.ability_state)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
        end
    end

    -- Initialize Joker
    init_joker(self_portrait)
end


-- Memorable Joker
if config.j_jank_memorable then
    -- Create Joker
    local memorable = {
        key = "memorable",
        config = {
            extra = {
                x_mult = 1,
                x_mult_gain = 0.1,
            }
        },
        rarity = 2,
        cost = 6,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 6, y = 1 },
    }
    
    -- Set local variables
    function memorable.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain } }
    end

    -- Calculate
    memorable.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.full_hand and #context.full_hand == 3 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                    Xmult_mod = card.ability.extra.x_mult
                }
            end
            card.ability.extra.x_mult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end

    -- Initialize Joker
    init_joker(memorable)
end

-- Tapestry Joker
if config.j_jank_tapestry then
    -- Create Joker
    local tapestry = {
        key = "tapestry",
        config = {
            extra = {
                mult = 0,
                mult_gain = 4,
                tapestry_list = {},
            }
        },
        rarity = 2,
        cost = 6,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 9, y = 2 },
    }
    
    -- Set local variables
    function tapestry.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end

    -- Calculate
    tapestry.calculate = function(self, card, context)
        if context.using_consumeable then
            local tapestry_list = card.ability.extra.tapestry_list
            local result = {
                id = context.consumeable.ability.order,
                set = context.consumeable.ability.set,
            }
            for _, item in ipairs(tapestry_list) do
                if item.id == result.id and item.set == result.set then
                    return nil
                end
            end
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') }); return true
                end
            }))
            return
                table.insert(tapestry_list, result)
        end
        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.mult > 0 then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                mult = card.ability.extra.mult
            }
        end
    end

    -- Initialize Joker
    init_joker(tapestry)
end

-- Sir Joker
if config.j_jank_sir then
    -- Create Joker
    local sir = {
        key = "sir",
        config = {
            extra = {
                x_mult = 1.5
            }
        },
        rarity = 1,
        cost = 4,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        pos = { x = 6, y = 2 },
    }
    
    -- Set local variables
    function sir.loc_vars(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult } }
    end

    -- Calculate
    sir.calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and (G.GAME.current_round.hands_left == 0 or G.GAME.blind.boss) then
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
                Xmult_mod = card.ability.extra.x_mult
            }
        end
    end

    -- Initialize Joker
    init_joker(sir)
end

-- JokerDisplay mod support
if JokerDisplay then
    SMODS.load_file("JokerDisplay_integration.lua")()
end