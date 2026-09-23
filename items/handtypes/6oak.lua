SMODS.PokerHand {
    key = 'mxms_6oak',
    prefix_config = {
        key = { mod = false }
    },
    mult = 18,
    chips = 180,
    l_mult = 4,
    l_chips = 40,
    atlas = 'poker_hands',
    pos = { x = 0, y = 2 },
    example = {

        { 'S_K', true },
        { 'D_K', true },
        { 'C_K', true },
        { 'H_K', true },
        { 'S_K', true },
        { 'D_K', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_6) and parts.mxms_6 or {}
    end
    modify_display_text = function(self, cards, scoring_hand)
        local devil = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            devil = devil and (rank.key == '6')
        end
        if devil then
          return 'mxms_devils_deal'
        else
            return 'mxms_6oak'
        end
    end
}
