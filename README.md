# Change Notifier

[![Change Notifier Make Build](https://github.com/sjalex78/change-notifier/actions/workflows/build.yml/badge.svg)](https://github.com/sjalex78/change-notifier/actions/workflows/build.yml)

## Overview

🏀🏀🏀
It's a tough gig having to manage 3 basketball players in one household who have 6 games every Friday night and Saturday morning! Can you imagine the confusion and madness when a game time or venue changes at the last minute? This project aims to let me know when a change has happened to cut out my need to check the website in the days leading up to a game. Ultimately it would integrate with my online calendar of choice but for now the aim is to;

- poll every 5 min
- run web query and process
- store result
- if result changes - send notification to users

## Dev

```sh
make build
```

## Scripts

```sh
 bin/dev # run local server 3000
```

```sh
 bin/rspec # run all ruby tests
 yarn watch # run all react tests
```
