#!/bin/bash
# Assembles body fragments with shared header+footer into full HTML pages.
set -e
cd "$(dirname "$0")"

build_page() {
  local slug="$1"
  local title="$2"
  local description="$3"
  local ticker="$4"

  local out="${slug}.html"
  local body="bodies/${slug}.html"

  # Build header with substitutions (use ~ as delimiter — unlikely in HTML content)
  sed -e "s~__TITLE__~${title}~g" \
      -e "s~__DESCRIPTION__~${description}~g" \
      -e "s~__TICKER__~${ticker}~g" \
      _header.html > "${out}"
  cat "${body}" >> "${out}"
  cat _footer.html >> "${out}"
  echo "✓ built ${out}"
}

TICKER_DEFAULT='<span class="ticker-item">🏏 IPL 2026 LIVE BETTING <span class="ticker-sep">◆</span></span><span class="ticker-item">⚡ INSTANT ID ACTIVATION <span class="ticker-sep">◆</span></span><span class="ticker-item">💰 WELCOME BONUS UP TO 20% <span class="ticker-sep">◆</span></span><span class="ticker-item">📱 24×7 WHATSAPP SUPPORT <span class="ticker-sep">◆</span></span>'

# Exchange pages
build_page "tigerexch-id" \
  "TigerExch ID – Get Instant TigerExch Cricket Betting ID | ID Cricket Online" \
  "TigerExch ID activated in 2 minutes on WhatsApp. 20% welcome bonus, clean UI, sharp IPL pricing and instant withdrawals." \
  "${TICKER_DEFAULT}"

build_page "diamondexch-id" \
  "DiamondExch ID – VIP Cricket Betting ID | ID Cricket Online" \
  "DiamondExch ID with VIP-tier stake limits up to ₹10 lakh, dedicated account manager and 5-minute withdrawals. Activated in 2 minutes." \
  "${TICKER_DEFAULT}"

build_page "fairbet-vs-world777" \
  "Fairbet vs World777 – Full Exchange Comparison | ID Cricket Online" \
  "Detailed Fairbet vs World777 comparison — bonuses, market depth, withdrawal times, casino, player limits. Get both IDs in one WhatsApp chat." \
  "${TICKER_DEFAULT}"

# Tournament pages
build_page "ipl-2026-cricket-id" \
  "IPL 2026 Cricket Betting ID – Get Instant IPL ID | ID Cricket Online" \
  "IPL 2026 betting ID activated on WhatsApp in 2 minutes. 30% IPL reload bonus, daily Dream11 tips, match previews and live ball-by-ball odds." \
  "${TICKER_DEFAULT}"

build_page "wpl-cricket-id" \
  "WPL Cricket Betting ID – Get WPL Betting ID Instantly | ID Cricket Online" \
  "WPL betting ID with deep women's cricket coverage, Dream11 tips, match previews and live in-play markets. Activated in 2 minutes." \
  "${TICKER_DEFAULT}"

build_page "psl-cricket-id" \
  "PSL Cricket Betting ID – Pakistan Super League ID | ID Cricket Online" \
  "PSL betting ID with match previews, Dream11 tips and venue-specific analytics. 20% PSL reload bonus. Activated in 2 minutes on WhatsApp." \
  "${TICKER_DEFAULT}"

build_page "womens-t20-world-cup-id" \
  "Women's T20 World Cup Betting ID | ID Cricket Online" \
  "ICC Women's T20 World Cup betting ID with deep tournament coverage, team analysis, Dream11 tips and tournament outright markets." \
  "${TICKER_DEFAULT}"

# Match center pages
build_page "todays-match-predictions" \
  "Today's Cricket Predictions – Daily Match Previews & Dream11 Tips | ID Cricket Online" \
  "Free daily cricket match predictions, pitch reports, head-to-head analysis and Dream11 Captain/Vice-Captain picks. Delivered to WhatsApp." \
  "${TICKER_DEFAULT}"

build_page "live-scores" \
  "Live Cricket Scores & Points Tables – Ball-by-Ball Updates | ID Cricket Online" \
  "Live cricket scores, ball-by-ball updates and points tables for IPL 2026, WPL, PSL and international cricket. Free WhatsApp alerts." \
  "${TICKER_DEFAULT}"

build_page "player-virat-kohli" \
  "Virat Kohli Stats, Form & Betting Angles | ID Cricket Online" \
  "Complete Virat Kohli stats — career numbers, format-wise breakdown, venue heat-map and specific betting market angles." \
  "${TICKER_DEFAULT}"

build_page "player-jasprit-bumrah" \
  "Jasprit Bumrah Stats, Form & Betting Angles | ID Cricket Online" \
  "Complete Jasprit Bumrah stats — career wickets, phase-wise bowling split, format breakdown and betting market angles." \
  "${TICKER_DEFAULT}"

build_page "player-smriti-mandhana" \
  "Smriti Mandhana Stats, Form & Betting Angles | ID Cricket Online" \
  "Complete Smriti Mandhana stats — career numbers, format-wise breakdown, venue heat-map and betting market angles for women's cricket." \
  "${TICKER_DEFAULT}"

# Offers pages
build_page "bonus-offers" \
  "Bonus Offers – Up To 20% Welcome Bonus | ID Cricket Online" \
  "Welcome bonus from 10% to 20% — highest in the Indian ID space. 1× rollover, no hidden wagering traps. Full bonus structure and rules." \
  "${TICKER_DEFAULT}"

build_page "withdrawal-proofs" \
  "Withdrawal Proofs – Live Payout Records | ID Cricket Online" \
  "Weekly withdrawal proofs, 30-day statistics, method-wise speed data and success rates. Average withdrawal: 7 min 40 sec." \
  "${TICKER_DEFAULT}"

build_page "refer-earn" \
  "Refer 5 Friends = ₹2000 Bonus – Refer & Earn Programme | ID Cricket Online" \
  "Refer 5 friends and earn ₹2,000 instant bonus plus 5% lifetime revenue share. Industry-best referral programme with cash payouts." \
  "${TICKER_DEFAULT}"

echo ""
echo "All pages built successfully."
