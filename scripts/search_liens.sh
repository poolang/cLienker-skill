#!/bin/bash
# Usage: ./search_liens.sh "county=Palm+Beach&max_ltv=15&sort_by=apy_high_low"
curl -s "https://api.lienfi.com/api/v1/liens?$1"
