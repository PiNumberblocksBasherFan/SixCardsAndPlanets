SMODS.PokerHand {
    key = 'mxms_f_6oak',
    prefix_config = {
        key = { mod = false }
    },
    mult = 22,
    chips = 220,
    l_mult = 5,
    l_chips = 50,
    atlas = 'poker_hands',
    pos = { x = 0, y = 10 },
    example = {

        { 'S_K', true },
        { 'S_K', true },
        { 'S_K', true },
        { 'S_K', true },
        { 'S_K', true },
        { 'S_K', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_6) and next(parts.mxms_s_flush)
            and { SMODS.merge_lists(parts.mxms_6, parts.mxms_s_flush) } or {}
    end
    modify_display_text = function(self, cards, scoring_hand)
        local devil = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            devil = devil and (rank.key == '6')
        end
        if devil then
          return 'mxms_angels_horns'
        else
            return 'mxms_f_6oak'
        end
    end
}
