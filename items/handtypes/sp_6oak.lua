SMODS.PokerHand {
    key = 'mxms_sp_6oak',
    prefix_config = {
        key = { mod = false }
    },
    mult = 26.4,
    chips = 264,
    l_mult = 6,
    l_chips = 60,
    atlas = 'poker_hands',
    pos = { x = 1, y = 5 },
    example = {

        { 'S_K', true },
        { 'H_K', true },
        { 'C_K', true },
        { 'D_K', true },
        { 'bunc_FLEURON_K', true },
        { 'bunc_HALBERD_K', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_6) and next(parts.s_spectrum)
            and { SMODS.merge_lists(parts.mxms_6, parts.s_spectrum) } or {}
    end
    modify_display_text = function(self, cards, scoring_hand)
        local devil = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            devil = devil and (rank.key == '6')
        end
        if devil then
          return 'mxms_hexachrome'
        else
            return 'mxms_sp_6oak'
        end
    end
}
