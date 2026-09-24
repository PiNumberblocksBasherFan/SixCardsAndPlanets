SMODS.PokerHand {
    key = 'mxms_sp_three_pair',
    prefix_config = {
        key = { mod = false }
    },
    mult = 16.8,
    chips = 180,
    l_mult = 3.6,
    l_chips = 36,
    atlas = 'poker_hands',
    pos = { x = 1, y = 1 },
    example = {

        { 'S_K', true },
        { 'H_K', true },
        { 'C_9', true },
        { 'D_9', true },
        { 'bunc_FLEURON_6', true },
        { 'bunc_HALBERD_6', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return #parts._2 == 3 and next(parts.s_spectrum) and
            { SMODS.merge_lists(parts._all_pairs, parts.s_spectrum) } or {}
    end
}
