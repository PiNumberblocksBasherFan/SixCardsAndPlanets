SMODS.PokerHandPart{ -- Spectrum base
    key = 's_spectrum',
    func = function(hand)
        local wild_cards = {}
        local locked_cards = {}
        local locked_suits = {}
        local flex_cards = {}

        for _, card in ipairs(hand) do
            if not SMODS.has_no_suit(card) then
                if SMODS.has_any_suit(card) then
                    table.insert(wild_cards, card)
                else
                    local suits = {}
                    for _, suit in ipairs(SMODS.Suit.obj_buffer) do
                        if card:is_suit(suit, nil, true) then
                            table.insert(suits, suit)
                        end
                    end

                    if #suits == 1 then
                        local s = suits[1]
                        locked_suits[s] = true
                        table.insert(locked_cards, card)
                    else
                        table.insert(flex_cards, {card = card, suits = suits})
                    end
                end
            end
        end

        local function count_keys(tbl)
            local n = 0
            for _ in pairs(tbl) do n = n + 1 end
            return n
        end

        local total_possible = count_keys(locked_suits) + #flex_cards + #wild_cards
        if total_possible < 6 then
            return {}
        end

        local initial_suit_count = count_keys(locked_suits)
        local needed = 6 - initial_suit_count

        if needed <= #wild_cards then
            -- wilds can fill remaining suit slots
            local all_cards = {}
            for _, c in ipairs(locked_cards) do table.insert(all_cards, c) end
            for _, f in ipairs(flex_cards) do table.insert(all_cards, f.card) end
            for _, w in ipairs(wild_cards) do table.insert(all_cards, w) end
            return {all_cards}
        end

        -- need to find (needed) more unique suits from flex cards
        local all_suits = {}
        for _, suit in ipairs(SMODS.Suit.obj_buffer) do
            if not locked_suits[suit] then
                table.insert(all_suits, suit)
            end
        end

        local function assign(i, used_cards, assigned_suits)
            if i > needed then return true end
            local suit = all_suits[i]

            for j, flex in ipairs(flex_cards) do
                if not used_cards[j] then
                    for _, s in ipairs(flex.suits) do
                        if s == suit then
                            used_cards[j] = true
                            assigned_suits[suit] = true
                            if assign(i + 1, used_cards, assigned_suits) then
                                return true
                            end
                            used_cards[j] = false
                            assigned_suits[suit] = nil
                            break
                        end
                    end
                end
            end

            return false
        end

        if needed <= #flex_cards and assign(1, {}, {}) then
            local all_cards = {}
            for _, c in ipairs(locked_cards) do table.insert(all_cards, c) end
            for _, f in ipairs(flex_cards) do table.insert(all_cards, f.card) end
            for _, w in ipairs(wild_cards) do table.insert(all_cards, w) end
            return {all_cards}
        else
            return {}
        end
    end
}
