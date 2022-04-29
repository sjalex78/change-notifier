.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: demo
demo:
	TEAM_ID=5712cf70 bin/demo_fetch.sh | jq
	TEAM_ID=005e3afb bin/demo_fetch.sh | jq

.PHONY: demo-extract
demo-extract:
	TEAM_ID=5712cf70 bin/demo_fetch.sh | jq -e '.data.discoverTeamFixture[] | \
		{ provisionalDate, \
			season: .grade.season.name, games: .fixture.games[] | \
		{away: .away.name, \
			home: .home.name, \
			time: .allocation.time, \
			court: .allocation.court.name, \
			venue_name: .allocation.court.venue.name, \
			venue_address: .allocation.court.venue.address, \
			venue_suburb: .allocation.court.venue.suburb, \
			venue_postcode: .allocation.court.venue.postcode }}'
	TEAM_ID=005e3afb bin/demo_fetch.sh | jq -e '.data.discoverTeamFixture[] | \
		{ provisionalDate, \
		  season: .grade.season.name, games: .fixture.games[] | \
		{away: .away.name, \
			home: .home.name, \
			time: .allocation.time, \
			court: .allocation.court.name, \
			venue_name: .allocation.court.venue.name, \
			venue_address: .allocation.court.venue.address, \
			venue_suburb: .allocation.court.venue.suburb, \
			venue_postcode: .allocation.court.venue.postcode }}'

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make demo${NC}           run demo fetch"
	@echo "${YELLOW}make demo-extract${NC}   run demo fetch and extract"
	@echo
