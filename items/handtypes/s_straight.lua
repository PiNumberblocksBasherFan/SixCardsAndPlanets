SMODS.PokerHand {
    key = 'mxms_s_straight',
    prefix_config = {
        key = { mod = false }
    },
    mult = 6,
    chips = 50,
    l_mult = 3,
    l_chips = 50,
    atlas = 'poker_hands',
    pos = { x = 0, y = 3 },
    example = {

        { 'S_Q', true },
        { 'D_J', true },
        { 'C_T', true },
        { 'H_9', true },
        { 'S_8', true },
        { 'D_7', true }

    },
    visible = false,
    evaluate = function(parts, hand)
        return next(parts.mxms_s_straight) and parts.mxms_s_straight or {}
    end
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.key == '9' or rank.face)
            mid = mid and (rank.key == '10' or rank.key == '9' or rank.key == '8' or rank.key == '7' or rank.key == '6' or rank.key == '5')
            wheel = wheel and (rank.key == 'Ace' orrank.key == '2' or rank.key == '3' or rank.key == '4' or rank.key == '5' or rank.key == '6')
        end
        if royal then
          return 'mxms_catwalk'
        else
            if mid then
              return 'mxms_indispensable'
            else
                if wheel then
                  return 'mxms_ship'
                else
                    return 'mxms_s_straight'
                end
            end
        end
    end
}
