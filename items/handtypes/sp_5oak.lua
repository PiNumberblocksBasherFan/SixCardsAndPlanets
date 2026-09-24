SMODS.PokerHand{ -- Spectrum Five
    key = 'Spectrum Five',
    visible = false,
    chips = 180,
    mult = 18,
    l_chips = 60,
    l_mult = 5,
    example = {
        { 'S_7', true },
        { 'D_7', true },
        { 'C_7', true },
        { 'H_7', true },
        { 'bunc_HALBERD_7', true }
    },
    evaluate = function(parts)
        if not next(parts._5) or not next(parts.spectrum_spectrum) then return {} end
        return {SMODS.merge_lists (parts._5, parts.spectrum_spectrum)}
    end
}
