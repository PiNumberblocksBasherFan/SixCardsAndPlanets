SMODS.PokerHand{ -- Spectrum
    key = 'Spectrum',
    visible = false,
    chips = 50,
    mult = 6,
    l_chips = 25,
    l_mult = 3,
    example = {
        { 'S_2',    true },
        { 'D_7',    true },
        { 'C_3',    true },
        { 'H_5',    true },
        { 'bunc_FLEURON_K',    true },
    },
    evaluate = function(parts)
        return parts.spectrum_spectrum
    end
}
