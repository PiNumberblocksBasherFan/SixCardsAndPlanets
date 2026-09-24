SMODS.PokerHand {
    key = 'mxms_s_spectrum',
    prefix_config = {
        key = { mod = false }
    },
    mult = 7.2,
    chips = 66,
    l_mult = 2.4,
    l_chips = 30,
    atlas = 'poker_hands',
    pos = { x = 1, y = 0 },
    example = {

        { 'S_A', true },
        { 'H_K', true },
        { 'C_J', true },
        { 'D_8', true },
        { 'bunc_FLEURON_6', true },
        { 'bunc_HALBERD_2', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.s_spectrum) and parts.s_spectrum or {}
    end
}
