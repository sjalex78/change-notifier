# Development Log

## March 15 2023

- attempt to fix GH Actions build error

  - error as below

  ```sh
  Downloading debug-1.7.1 revealed dependencies not in the API or the lockfile
  (irb (>= 1.5.0), reline (>= 0.3.1)).
  Either installing with `--full-index` or running `bundle update debug` should
  fix the problem.
  Error: The process '/opt/hostedtoolcache/Ruby/3.2.1/x64/bin/bundle' failed with exit code 34
  ```

  - in the end reproduced it by uninstalling the gem and bundling the gem file

  ```sh
  gem uninstall debug
  bundle

    Downloading debug-1.7.1 revealed dependencies not in the API or the lockfile
    (irb (>= 1.5.0), reline (>= 0.3.1)).
    Either installing with `--full-index` or running `bundle update debug` should

  bundle update debug
  # which caused irb and reline changes in the Gemfile.lock
  ```

- adding site prism

```sh
bundle add site_prism
```

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
