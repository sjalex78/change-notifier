# Development Log

## March 15 2023

- adding rspec and capybara testing suites

```sh
bundle add \
  capybara \
  rspec-rails \
  capybara-inline-screenshot \
  selenium-webdriver \
  webdrivers \
  rspec-example_steps


  rails generate rspec:install
```

- adding github build action via workflows yaml instructions

- rubocop fix script and subsequently needed to ignore out .present? fix

```sh
bundle exec rubocop -A
```

- upgrade rubocop to use standard as per [article](https://evilmartians.com/chronicles/rubocoping-with-legacy-bring-your-ruby-code-up-to-standard), overrides are located in the `.rubocop_local.yml`

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
