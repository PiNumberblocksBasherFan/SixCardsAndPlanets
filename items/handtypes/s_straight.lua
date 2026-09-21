SMODS.PokerHand {
    key = 'mxms_s_straight',
    prefix_config = {
        key = { mod = false }
    },
    mult = 6,
    chips = 50,
    l_mult = 3,
    l_chips = 50,
    atlas = 'poker_hands',
    pos = { x = 0, y = 3 },
    example = {

        { 'S_Q', true },
        { 'D_J', true },
        { 'C_T', true },
        { 'H_9', true },
        { 'S_8', true },
        { 'D_7', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_s_straight) and parts.mxms_s_straight or {}
    end
}
