SMODS.PokerHand {
    key = 'mxms_sp_party',
    prefix_config = {
        key = { mod = false }
    },
    mult = 19.2,
    chips = 216,
    l_mult = 4.8,
    l_chips = 60,
    atlas = 'poker_hands',
    pos = { x = 1, y = 4 },
    example = {

        { 'S_A', true },
        { 'H_A', true },
        { 'C_A', true },
        { 'D_A', true },
        { 'bunc_FLEURON_T', true },
        { 'bunc_HALBERD_T', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        if #parts._4 < 1 or #parts._2 < 2 then return {} end
        return #hand >= 6 and next(parts._2) and next(parts._4) and next(parts.s_spectrum)
            and { SMODS.merge_lists(parts._all_pairs, parts.s_spectrum) } or {}
    end
}
