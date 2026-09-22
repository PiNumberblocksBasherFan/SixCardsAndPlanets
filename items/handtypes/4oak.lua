SMODS.PokerHand {
    key = '4oak',
    prefix_config = {
        key = { mod = false }
    },
    mult = 7,
    chips = 60,
    l_mult = 3,
    l_chips = 30,
    atlas = 'poker_hands',
    pos = { x = 1, y = 9 },
    example = {

        { 'S_A', true },
        { 'D_A', true },
        { 'C_A', true },
        { 'H_A', true },
        { 'S_K', false },

    },
    visible = true,
    evaluate = function(parts, hand)
        return next(parts.4oak) and parts.4oak or {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            royal = royal and rank.face
            square = square and (rank.key == '9' or rank.key == '4')
        end
        if royal then
          return 'mxms_horsemen'
        else
            if square then
              return 'mxms_square'
            else
              return '4oak'
            end
        end
    end
}
