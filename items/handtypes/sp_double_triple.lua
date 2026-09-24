SMODS.PokerHand {
    key = 'mxms_sp_double_triple',
    prefix_config = {
        key = { mod = false }
    },
    mult = 19.2,
    chips = 204,
    l_mult = 4.8,
    l_chips = 60,
    atlas = 'poker_hands',
    pos = { x = 1, y = 2 },
    example = {

        { 'S_K', true },
        { 'H_K', true },
        { 'C_K', true },
        { 'D_9', true },
        { 'bunc_FLEURON_9', true },
        { 'bunc_HALBERD_9', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return #parts._3 >= 2 and next(parts.s_spectrum)
            and { SMODS.merge_lists(parts._all_pairs, parts.s_spectrum) } or {}
    end
}
