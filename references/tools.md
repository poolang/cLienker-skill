# Tools

- **scripts/search_liens.sh "<query string>"** — filtered search across
  current listings. Parameters (all optional, combine freely):
  - Location: state, states, county, counties, municipality, municipalities
  - Price/value: min_price, max_price, min_face_value, max_face_value,
    min_assessed_value, max_assessed_value
  - Risk/return: min_ltv, max_ltv, min_interest, max_interest
  - Property: property_type, property_types, property_quality_grades (A-D)
  - Deal: deal_type, deal_types (fixed/par/discount/premium),
    acquisition_sources (auction/secondary)
  - Status: status, statuses (default "listed")
  - Timing: maturity_after, maturity_before (YYYY-MM-DD)
  - Other: search (free text), sort_by (e.g. apy_high_low, maturity_soonest)
  - county must match exactly — call get_facets.sh first if unsure.
  - Response WARNING: each lien object includes calculated.apy,
    calculated.dynamic_blended_apy, and calculated.total_yield_to_maturity —
    these are GROSS (before LienFi's fee) and must never be quoted as "the
    return." Also includes raw redemptive_value, accrued_interest, and
    listing_price fields that are STALE snapshots — always use
    calculated.current_redemptive_value and calculated.current_listing_price
    instead. See references/data-interpretation.md before presenting any
    number from a search result.

- **scripts/get_lien_by_id.sh <lien_id>** — full detail on one specific
  lien. ALWAYS call before making a final recommendation. Same gross-vs-net
  and stale-vs-live field warnings as search_liens.sh apply here — read
  references/data-interpretation.md before quoting any figure from this
  response.

- **scripts/get_facets.sh** — no arguments. Returns valid states/counties/
  property types/grades and current min/max ranges.

- **scripts/get_market_activity.sh** — no arguments. Recent purchases/
  relists/redemptions. type field: "purchase", "relist", "redeem"
  ("redeem" = good outcome, owner paid off the debt).

- **scripts/get_risk_disclosure.sh** — LienFi's live official risk
  disclosure.

- **scripts/get_terms.sh** — LienFi's live official Terms & Conditions.
  Prefer this over assuming fee rates from memory.
