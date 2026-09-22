SMODS.PokerHand {
    key = "straight_f',
    prefix_config = {
        key = { mod = false }
    },
    mult = 8,
    chips = 100,
    l_mult = 4,
    l_chips = 40,
    atlas = 'poker_hands',
    pos = { x = 1, y = 7 },
    example = {

        { 'S_Q', true },
        { 'S_J', true },
        { 'S_T', true },
        { 'S_9', true },
        { 'S_8', true },

    },
    visible = true,
    evaluate = function(parts, hand)
        return next(parts.straight) and next(parts.flush)
            and { SMODS.merge_lists(parts.straight, parts.flush) } or {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
            mid = mid and (rank.key == '10' or rank.key == '9' or rank.key == '8' or rank.key == '7' or rank.key == '6' or rank.key == '5')
            wheel = wheel and (rank.key == 'Ace' orrank.key == '2' or rank.key == '3' or rank.key == '4' orrank.key == '5')
        end
        if royal then
          return 'royal_f'
        else
            if mid then
              return 'mxms_midhandflush'
            else
                if wheel then
                  return 'mxms_steel_wheel'
                else
                    return 'straight_f'
                end
            end
        end
    end
}
