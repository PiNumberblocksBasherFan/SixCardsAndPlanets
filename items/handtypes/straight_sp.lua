SMODS.PokerHand{ -- Straight Spectrum
    key = 'straight_sp',
    visible = false,
    chips = 120,
    mult = 10,
    l_chips = 35,
    l_mult = 5,
    example = {
        { 'S_Q',    true },
        { 'H_J',    true},
        { 'C_T',    true },
        { 'D_9',    true },
        { 'bunc_HALBERD_8',    true }
    },
    process_loc_text = function(self)
        SMODS.PokerHand.process_loc_text(self)
        SMODS.process_loc_text(G.localization.misc.poker_hands, self.key..'_2', self.loc_txt, 'extra')
    end,
    evaluate = function(parts)
        if not next(parts.spectrum) or not next(parts._straight) then return {} end
        return { SMODS.merge_lists (parts.spectrum, parts._straight) }
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local royal = true
        for i = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[i].base.value]
            royal = royal and (rank.key == 'Ace' or rank.key == '10' or rank.face)
            mid = mid and (rank.key == '10' or rank.key == '9' or rank.key == '8' or rank.key == '7' or rank.key == '6' or rank.key == '5')
            wheel = wheel and (rank.key == 'Ace' orrank.key == '2' or rank.key == '3' or rank.key == '4' or rank.key == '5')
        end
        if royal then
          return 'mxms_rainbow_road'
        else
            if mid then
              return 'mxms_indispensable_sp'
            else
                if wheel then
                  return 'mxms_colour_wheel'
                else
                    return 'straight_sp'
                end
            end
        end
    end
}
