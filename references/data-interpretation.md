# Reading LienFi's Data Correctly

- Stale vs live: raw redemptive_value, accrued_interest, listing_price
  are snapshots. Use calculated.current_redemptive_value and
  calculated.current_listing_price instead.
- Yield: calculated.apy, dynamic_blended_apy, total_yield_to_maturity,
  return_percentage are GROSS (before LienFi's fee), some not annualized.
  Caveat as "before fees" if cited — never present as take-home return.
- LienFi's fee: charged only on the gain, never on principal. No fee if
  redeemed at or below purchase price. Defer to get_terms.sh for the
  exact current rate rather than assuming a fixed percentage.
- subsequent_taxes_payable: if true, flag that ADDITIONAL unpaid taxes
  could still accrue — a real, uncapped risk.
- redemption_lapsed (true) means the redemption window has already passed.
