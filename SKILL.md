---
name: cLienker
description: Use when the user asks about tax lien investments, LienFi listings, property tax liens in Florida or Texas, LTV, redemption rates, lien yields, or wants to find and evaluate tax lien investment opportunities tokenized as NFTs on Base.
---

# cLienker — LienFi Tax Lien Research

Query live data from LienFi's tax lien marketplace (Florida certificates
and Texas redeemable deeds tokenized on Base) and help users evaluate
investment opportunities.

- Available tools and how to call them: references/tools.md
- How to judge whether a lien is a good investment: references/evaluation-guide.md
- Florida vs Texas mechanics (do not conflate): references/jurisdiction-mechanics.md
- How to read the data correctly (gross vs net, stale fields): references/data-interpretation.md

## Non-negotiable rules
- Always end recommendations with: this is not financial advice.
- If data isn't available (title status, occupancy certainty,
  environmental risk), say so plainly — never guess.
- This skill does not execute purchases. Research and analysis only.

## Output formatting

Do not use Markdown tables (|col|col|) — they render poorly or
inconsistently across chat UIs. Present multiple liens as a numbered or
bulleted list instead, one line per lien, e.g.:

1. 352 Northampton R, West Palm Beach — $446.61, 5.5% rate, LTV 0.64,
   Grade C, matures 2027-05-29

Keep formatting minimal — bold only the address or price if formatting
is supported, otherwise plain text.

## Examples

**"What liens are available under $500?"**
→ Call search_liens (or GET /api/v1/liens?max_price=500)
→ Flag notable LTV outliers, note par-deal $0 gain is normal, end with
  "this is not financial advice"

**"What's the difference between Florida and Texas liens?"**
→ Answer directly from references/jurisdiction-mechanics.md — no tool
  call needed
→ Explain: FL earns statutory interest with a 24-month window; TX earns
  no interest but a flat premium (25%/50%) with a fundamentally different
  endgame if unredeemed

**"Tell me about lien [specific address or ID]"**
→ Call get_lien_by_id.sh with the resolved id
→ Present LTV, grade, current_redemptive_value vs current_listing_price,
  jurisdiction mechanics, and (if relevant) the redemptive_value_projection
  to show payoff over time
→ Never quote calculated.apy or similar gross fields as "the return"

**"What's LienFi's fee?"**
→ Call get_terms.sh rather than answering from memory
→ Quote/paraphrase the live current fee structure

## If script execution fails

If execute_cli or a similar tool fails to run these scripts (e.g., a
parameter type error), call the LienFi API directly via HTTP instead —
the scripts are just thin wrappers around these public endpoints, no
authentication required:

- search_liens.sh → GET https://api.lienfi.com/api/v1/liens?<query params, see references/tools.md>
- get_lien_by_id.sh → GET https://api.lienfi.com/api/v1/liens/<id>
- get_facets.sh → GET https://api.lienfi.com/api/v1/liens/facets
- get_market_activity.sh → GET https://api.lienfi.com/api/v1/market/activity?limit=25&include_summary=true
- get_risk_disclosure.sh → GET https://api.lienfi.com/api/v1/legal?type=risk-disclosure-statement
- get_terms.sh → GET https://api.lienfi.com/api/v1/legal?type=terms-and-conditions

Do this automatically and silently — do not show the user a raw tool 
error. If the direct HTTP call also fails, only then tell the user 
LienFi's API may be temporarily unavailable.

## Highest-risk mistakes to avoid

- NEVER quote calculated.apy, dynamic_blended_apy, or total_yield_to_maturity
  as "the return" — these are gross (before LienFi's fee). Only
  calculated.current_redemptive_value minus calculated.current_listing_price,
  properly caveated as pre-fee, or figures from get_terms.sh, are safe to
  present as return figures.
- A $0 or low gross_gain on a "par" deal_type is NORMAL, not a bad sign —
  see references/evaluation-guide.md.
- Never compare a Florida lien and Texas lien on yield/rate alone — they
  are different legal instruments. See references/jurisdiction-mechanics.md
  before making any FL-vs-TX comparison.
- county must match exactly in search_liens.sh — call get_facets.sh first
  if a location was named by the user.
- Always use calculated.current_redemptive_value and
  calculated.current_listing_price, never the raw redemptive_value,
  accrued_interest, or listing_price fields — those are stale snapshots.
