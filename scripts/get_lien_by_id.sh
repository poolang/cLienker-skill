#!/bin/bash
# Usage: ./get_lien_by_id.sh <lien_id>
curl -s "https://api.lienfi.com/api/v1/liens/$1"
