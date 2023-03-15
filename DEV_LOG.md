# Development Log

## March 15 2023

- run server and updating git ignore which was missed in rails new

```sh
bin/setup
bin/dev
```

- running rails new and install postgres gem

```sh
rails new . --database=postgresql --skip-test --css tailwind --javascript esbuild --skip-git
brew install libpq
gem install pg -- --with-pg-config="/opt/homebrew/opt/libpq/bin/pg_config"
bundle
```

- setting ruby to latest version and making .tool-versions

```sh
asdf local ruby 3.2.1
```
