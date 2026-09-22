SMODS.PokerHand {
    key = 'straight',
    prefix_config = {
        key = { mod = false }
    },
    mult = 4,
    chips = 30,
    l_mult = 3,
    l_chips = 30,
    atlas = 'poker_hands',
    pos = { x = 1, y = 6 },
    example = {

        { 'S_Q', true },
        { 'H_J', true },
        { 'D_T', true },
        { 'C_9', true },
        { 'S_8', true },

    },
    visible = true,
    evaluate = function(parts, hand)
        return next(parts.straight)
            and { SMODS.merge_lists(parts.straight) } or {}
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
          return 'mxms_broadway'
        else
            if mid then
              return 'mxms_midhand'
            else
                if wheel then
                  return 'mxms_wheel'
                else
                    return 'straight'
                end
            end
        end
    end
}
