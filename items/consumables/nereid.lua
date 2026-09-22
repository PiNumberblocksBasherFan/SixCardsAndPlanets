SMODS.Consumable {
    key = 'mxms_nereid',
    prefix_config = {
        key = { mod = false }
    },
    set = 'Planet',
    atlas = 'Consumables',
    pos = {
        x = 5,
        y = 3
    },
    config = {
        hand_type = 'mxms_midhandflush',
        softlock = true
    },
    otm_credits = {
        art = { "PiNumberblocksBasherFan" },
        code = { "theAstra" }
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars =
            {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, "poker_hands"),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = {
                    (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)])
                }
            },
        }
    end,
    in_pool = function(self, args)
        if (G.GAME and G.GAME.starting_params.play_limit >= 6) then
            return true
        end

        return true
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_mxms_satellite'), get_type_colour(card.config.center, card), nil,
        1.2)
