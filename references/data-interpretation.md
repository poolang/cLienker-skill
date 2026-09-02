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
- ltv_ratio is already expressed as a PERCENTAGE (e.g., 1.71 means 1.71%, 
  not 171% or a 1.71 ratio). All liens on this platform have historically 
  shown very low LTVs (under ~5%) — do not describe an LTV above 1.0 as 
  "exceeding" anything or as unsafe without checking the actual percentage 
  value against a real threshold (e.g., 20%+ would be comparatively 
  elevated for this platform).
