SMODS.PokerHand {
    key = 'mxms_s_straight_f',
    prefix_config = {
        key = { mod = false }
    },
    mult = 20,
    chips = 200,
    l_mult = 5,
    l_chips = 55,
    atlas = 'poker_hands',
    pos = { x = 0, y = 8 },
    example = {

        { 'S_Q', true },
        { 'S_J', true },
        { 'S_T', true },
        { 'S_9', true },
        { 'S_8', true },
        { 'S_7', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_s_straight) and next(parts.mxms_s_flush)
            and { SMODS.merge_lists(parts.mxms_s_straight, parts.mxms_s_flush) } or {}
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
          return 'mxms_super_royal'
        else
            if mid then
              return 'mxms_indispensable_f'
            else
                if wheel then
                  return 'mxms_yacht'
                else
                    return 'mxms_s_straight_f'
                end
            end
        end
    end
}
