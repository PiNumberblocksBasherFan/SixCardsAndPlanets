SMODS.PokerHand{ -- Spectrum House
    key = 'sp_house',
    visible = false,
    chips = 150,
    mult = 15,
    l_chips = 50,
    l_mult = 5,
    example = {
        { 'S_Q',    true },
        { 'H_Q',    true },
        { 'C_Q',    true },
        { 'D_8',    true },
        { 'bunc_FLEURON_8',    true }
    },
    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.spectrum_spectrum) then return {} end
        return {SMODS.merge_lists (parts._all_pairs, parts.spectrum_spectrum)}
    end
}
