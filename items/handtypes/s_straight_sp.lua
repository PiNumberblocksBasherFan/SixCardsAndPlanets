SMODS.PokerHand {
    key = 'mxms_s_straight_sp',
    prefix_config = {
        key = { mod = false }
    },
    mult = 24,
    chips = 240,
    l_mult = 6,
    l_chips = 66,
    atlas = 'poker_hands',
    pos = { x = 1, y = 3 },
    example = {

        { 'S_Q', true },
        { 'H_J', true },
        { 'C_T', true },
        { 'D_9', true },
        { 'bunc_FLEURON_8', true },
        { 'bunc_HALBERD_7', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_s_straight) and next(parts.s_spectrum)
            and { SMODS.merge_lists(parts.mxms_s_straight, parts.s_spectrum) } or {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.key == '9' or rank.face)
            mid = mid and (rank.key == '10' or rank.key == '9' or rank.key == '8' or rank.key == '7' or rank.key == '6' or rank.key == '5')
            wheel = wheel and (rank.key == 'Ace' orrank.key == '2' or rank.key == '3' or rank.key == '4' or rank.key == '5' or rank.key == '6')
        end
        if royal then
          return 'mxms_glacier'
        else
            if mid then
              return 'mxms_indispensable_sp'
            else
                if wheel then
                  return 'mxms_submarine'
                else
                    return 'mxms_s_straight_sp'
                end
            end
        end
    end
}
