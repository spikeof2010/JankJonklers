--- STEAMODDED HEADER
--- MOD_NAME: Jank Challenges
--- MOD_ID: JankChallenges
--- PREFIX: jankch
--- MOD_AUTHOR: [Lyman]
--- MOD_DESCRIPTION: Challenges for Jank Jonklers.

----------------------------------------------
------------MOD CODE -------------------------

SMODS.Challenge({
    key = "pawnshop",
    rules = {
        custom = {
            {id = 'no_reward_specific', value = 'Small'},
            {id = 'no_reward_specific', value = 'Big'},
            {id = 'no_extra_hand_money'},
            {id = 'no_interest'},
        },
    },
    jokers = {
        {id = 'j_jank_pawn', edition = 'negative', eternal = true},
        {id = 'j_jank_scrapper'},
    },
    vouchers = {
        {id = 'v_overstock_norm'},
    },
    deck = {
        type = 'Challenge Deck',
        cards = {{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='K',},{s='D',r='A',g='Blue',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='K',},{s='C',r='A',g='Blue',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='K',},{s='H',r='A',g='Blue',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='K',},{s='S',r='A',g='Blue',},}
    },
    restrictions = {
        banned_cards = {
            {id = 'c_temperance'},
            {id = 'c_hermit'},
            {id = 'c_devil'},
            {id = 'c_familiar'},
            {id = 'c_grim'},
            {id = 'c_incantation'},
            {id = 'c_talisman'},
            {id = 'c_immolate'},
            {id = 'j_delayed_grat'},
            {id = 'j_business'},
            {id = 'j_faceless'},
            {id = 'j_todo_list'},
            {id = 'j_vagabond'},
            {id = 'j_cloud_9'},
            {id = 'j_rocket'},
            {id = 'j_midas_mask'},
            {id = 'j_reserved_parking'},
            {id = 'j_mail'},
            {id = 'j_to_the_moon'},
            {id = 'j_golden'},
            {id = 'j_trading'},
            {id = 'j_ticket'},
            {id = 'j_certificate'},
            {id = 'j_rough_gem'},
            {id = 'j_matador'},
            {id = 'j_satellite'},
            {id = 'j_jank_fortuno'},
            {id = 'v_clearance_sale'},
            {id = 'v_liquidation'},
            {id = 'v_seed_money'},
            {id = 'v_money_tree'},
            {id = 'p_standard_normal_1', ids = {
                'p_standard_normal_1','p_standard_normal_2','p_standard_normal_3','p_standard_normal_4','p_standard_jumbo_1','p_standard_jumbo_2','p_standard_mega_1','p_standard_mega_2',
            }},
        },
        banned_tags = {
            {id = 'tag_garbage'},
            {id = 'tag_handy'},
            {id = 'tag_skip'},
            {id = 'tag_coupon'},
            {id = 'tag_investment'},
            {id = 'tag_economy'},
        },
    }
})

SMODS.Challenge({
    key = "LoJ",
    rules = {
        custom = {
            {id = 'no_reward_specific', value = 'Boss'},
        },
        modifiers = {
            {id = 'discards', value = 2},
            {id = 'hands', value = 3},
            {id = 'hand_size', value = 7},
        }
    },
    jokers = {
        {id = 'j_jank_old_man', eternal = true}
    },
    deck = {
        type = 'Challenge Deck'
    },
    restrictions = {
        banned_cards = {
            {id = 'c_ankh'},
            {id = 'c_hex'},
        },
    }
})

----------------------------------------------
------------MOD CODE END----------------------