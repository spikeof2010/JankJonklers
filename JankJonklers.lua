--- STEAMODDED HEADER
--- MOD_NAME: JankJonklersMod
--- MOD_ID: JankJonklersMod
--- MOD_AUTHOR: [Lyman]
--- MOD_DESCRIPTION: Adds a bunch of Jank Jonklers.

----------------------------------------------
------------MOD CODE -------------------------

local MOD_ID = "JankJonklersMod";

-- Lyman: i am continuing the tradition of grifting off everyone else >:)
-- Thanks GoldenEpsilon!
-- https://github.com/GoldenEpsilon/ShamPack/blob/main/ShamPack.lua
local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
    set_spritesref(self, _center, _front);
    if _center then
        if _center.set then
            if (_center.set == 'Joker' or _center.consumeable or _center.set == 'Voucher') and _center.atlas then
                self.children.center.atlas = G.ASSET_ATLAS
                    [(_center.atlas or (_center.set == 'Joker' or _center.consumeable or _center.set == 'Voucher') and _center.set) or 'centers']
                self.children.center:set_sprite_pos(_center.pos)
            end
        end
    end
end

-- https://github.com/GoldenEpsilon/ShamPack/blob/main/ShamPack.lua
function add_item(mod_id, pool, id, data, desc)
    -- Add Sprite
    data.pos = { x = 0, y = 0 };
    data.key = id;
    data.atlas = mod_id .. id;
    SMODS.Sprite:new(mod_id .. id, SMODS.findModByID(mod_id).path, id .. ".png", 71, 95, "asset_atli"):register();

    data.key = id
    data.order = #G.P_CENTER_POOLS[pool] + 1
    G.P_CENTERS[id] = data
    table.insert(G.P_CENTER_POOLS[pool], data)

    if pool == "Joker" then
        table.insert(G.P_JOKER_RARITY_POOLS[data.rarity], data)
    end

    G.localization.descriptions[pool][id] = desc;
end

-- https://github.com/GoldenEpsilon/ShamPack/blob/main/ShamPack.lua
function refresh_items()
    for k, v in pairs(G.P_CENTER_POOLS) do
        table.sort(v, function(a, b) return a.order < b.order end)
    end

    -- Update localization
    for g_k, group in pairs(G.localization) do
        if g_k == 'descriptions' then
            for _, set in pairs(group) do
                for _, center in pairs(set) do
                    center.text_parsed = {}
                    for _, line in ipairs(center.text) do
                        center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                    end
                    center.name_parsed = {}
                    for _, line in ipairs(type(center.name) == 'table' and center.name or { center.name }) do
                        center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
                    end
                    if center.unlock then
                        center.unlock_parsed = {}
                        for _, line in ipairs(center.unlock) do
                            center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
                        end
                    end
                end
            end
        end
    end

    for k, v in pairs(G.P_JOKER_RARITY_POOLS) do
        table.sort(G.P_JOKER_RARITY_POOLS[k], function(a, b) return a.order < b.order end)
    end
end

function SMODS.INIT.MultiJokersMod()
    add_item(MOD_ID, "Joker", "j_devilish", {
        unlocked = true,
        discovered = true,
        rarity = 2,
        cost = 5,
        name = "Devilish Joker",
        set = "Joker",
        config = {
            extra = { x_mult = 3 },
        },
    }, {
        name = "Devilish Joker",
        text = {
            "{X:mult,C:white}x3{} Mult if played",
            "hand contains only {C:attention}6s{}",
            "or {C:attention}Gold Cards{}."
        }
    });

    add_item(MOD_ID, "Joker", "j_expanded_art", {
        unlocked = true,
        discovered = true,
        rarity = 1,
        cost = 4,
        name = "Expanded Art Joker",
        set = "Joker",
        config = {
            extra = { chips = 30 },
        },
    }, {
        name = "Expanded Art Joker",
        text = {
            "{C:attention}Enhanced Cards{} gives",
            "{C:chips}+30{} Chips when scored"
        }
    });

    add_item(MOD_ID, "Joker", "j_highlander", {
        unlocked = true,
        discovered = true,
        rarity = 1,
        cost = 4,
        name = "Highlander Joker",
        set = "Joker",
        config = {
            extra = 20,
        },
    }, {
        name = "Highlander Joker",
        text = {
            "Every scoring card permanently",
            "gains {C:chips}+20{} Chips when scored if",
            "your hand is a {C:attention}High Card{}."
        }
    });

    add_item(MOD_ID, "Joker", "j_lieutenant", {
        unlocked = true,
        discovered = true,
        rarity = 3,
        cost = 8,
        name = "Lieutenant Joker",
        set = "Joker",
        config = {
        },
    }, {
        name = "Lieutenant Joker",
        text = {
            "After you play a {C:attention}High Card{}",
            "increase the {C:attention}rank{}",
            "of each card played."
        }
    });

    add_item(MOD_ID, "Joker", "j_shady_dealer", {
        unlocked = true,
        discovered = true,
        rarity = 3,
        cost = 8,
        name = "Shady Dealer",
        set = "Joker",
        config = {
        },
    }, {
        name = "Shady Dealer",
        text = {
            "Sell this card to create a",
            "free {C:attention}Negative Tag{}"
        }
    });

    add_item(MOD_ID, "Joker", "j_suspicious_vase", {
        unlocked = true,
        discovered = true,
        rarity = 2,
        cost = 5,
        name = "Suspicious Vase",
        set = "Joker",
        config = {
            extra = 2,
        },
    }, {
        name = "Suspicious Vase",
        text = {
            "All {C:attention}2s{} and {C:attention}3s{}",
            "become {C:attention}Glass Cards{}",
            "when played."
        }
    });
    -- Apply our changes
    refresh_items();
end

function table_length(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local calculate_jokerref = Card.calculate_joker;

function Card:calculate_joker(context)
    local ret_val = calculate_jokerref(self, context)
    if self.ability.set == "Joker" and not self.debuff then
        if context.individual then
            if context.cardarea == G.play then
                if self.ability.name == 'Expanded Art Joker' and context.other_card.ability.set == 'Enhanced' then
                    return {
                        chips = self.ability.extra.chips,
                        colour = G.C.RED,
                        card = self
                    }
                end
                if self.ability.name == 'Suspicious Vase' and (context.other_card:get_id() == 2 or context.other_card:get_id() == 3) then
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
                        x_mult = self.ability.extra,
                        card = self
                    } 
                end
                if self.ability.name == "Highlander Joker" and context.scoring_name == "High Card" and not context.blueprint then
                    context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                    context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + self.ability.extra
                    return {
                        extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
                        colour = G.C.CHIPS,
                        card = self
                    }
                end
                if self.ability.name == "Lieutenant Joker" and context.scoring_name == "High Card" then
                    for k, v in ipairs(context.full_hand) do
                        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                            local card = v
                            local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
                            local rank_suffix = card.base.id == 14 and 2 or math.min(card.base.id+1, 14)
                            if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
                            elseif rank_suffix == 10 then rank_suffix = 'T'
                            elseif rank_suffix == 11 then rank_suffix = 'J'
                            elseif rank_suffix == 12 then rank_suffix = 'Q'
                            elseif rank_suffix == 13 then rank_suffix = 'K'
                            elseif rank_suffix == 14 then rank_suffix = 'A'
                            end
                            card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                        return true end }))
                    end
                end
            end
        elseif context.cardarea == G.jokers then
            if context.joker_main then
                if self.ability.name == 'Devilish Joker' then
                    local onlySixes = true
                    for k, v in ipairs(context.full_hand) do
                        onlySixes = onlySixes and (v:get_id() == 6 or v.ability.name == 'Gold Card')
                    end
                    if not onlySixes then
                        return nil
                    end
                    return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.extra.x_mult } },
                        Xmult_mod = self.ability.extra.x_mult
                    }
                end
            end
        elseif context.selling_self then
            if self.ability.name == 'Shady Dealer' then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_negative'))
                        play_sound('generic1', 0.6 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.1 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
            end
        end
    end
    return ret_val
end




local card_uiref = Card.generate_UIBox_ability_table;
function Card:generate_UIBox_ability_table()
    local badges = {}
    local card_type = self.ability.set or "None"
    local loc_vars = nil

    if self.ability.name == 'Devilish Joker' then
        loc_vars = { self.ability.extra.x_mult }
    end
    if (card_type ~= 'Locked' and card_type ~= 'Undiscovered' and card_type ~= 'Default') or self.debuff then
        badges.card_type = card_type
    end
    if self.ability.set == 'Joker' and self.bypass_discovery_ui then
        badges.force_rarity = true
    end
    if self.edition then
        if self.edition.type == 'negative' and self.ability.consumeable then
            badges[#badges + 1] = 'negative_consumable'
        else
            badges[#badges + 1] = (self.edition.type == 'holo' and 'holographic' or self.edition.type)
        end
    end
    if self.seal then badges[#badges + 1] = string.lower(self.seal) .. '_seal' end
    if self.ability.eternal then badges[#badges + 1] = 'eternal' end
    if self.pinned then badges[#badges + 1] = 'pinned_left' end

    if self.sticker then
        loc_vars = loc_vars or {}; loc_vars.sticker = self.sticker
    end

    if self.ability.name == 'Devilish Joker' then
        return generate_card_ui(self.config.center, nil, loc_vars, card_type, badges, false, nil, nil)
    end

    return card_uiref(self)
end


----------------------------------------------
------------MOD CODE END----------------------