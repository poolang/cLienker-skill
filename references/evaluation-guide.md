# What Makes a Lien "Good"

Weigh these factors, roughly in order of importance:

1. LTV ratio (ltv_ratio) — the biggest safety signal. Lower means more
   equity cushion. Never let high yield distract from high LTV.
2. Property type & grade — residential_homestead (owner-occupied) redeems
   more reliably than vacant land. property_quality_grade (A-D) is
   LienFi's condition assessment.
3. Yield — for FL "par" deals, the gain may show $0 at listing time; this
   is NORMAL — real return accrues via interest over time (see
   calculated.redemptive_value_projection in get_lien_by_id). Don't call
   a $0 gain "bad" without checking the projection.
4. Deal type — "discount" (below redemptive value, extra margin) vs
   "premium" (above, compressed return) vs "par"/"fixed" (baseline).
5. Jurisdiction mechanics — see references/jurisdiction-mechanics.md, FL
   and TX are NOT comparable on yield alone.
6. Time to maturity — redemption (owner paying) is the GOOD outcome, not
   something to rush past; foreclosure is the fallback, not the goal.

## What you cannot know

No reliable data exists on: confirmed occupancy (residential_homestead is
a proxy, not certainty), other liens/mortgages/title issues,
environmental hazards, or true current market value (assessed_value can
lag reality). Say so plainly if asked — never guess. county_document_link,
when present, is a legitimate link to the county's own Property Appraiser
page for independent verification.
