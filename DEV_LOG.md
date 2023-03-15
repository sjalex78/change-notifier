# Development Log

## March 19 2023

- create flash error messages from controller and request spec
- TODO: add view spec for flash messages
- create an isolated controller test for create and save team happy path
- create an isolated controller test for index

## March 17 2023

- create team model using model using

```sh
rails generate model team name:string url:string --force
```

- test were not behaving as expected realising that the spike form March 16 has generated a table and required the DB to be dumped and remigrated, TODO: add to the make build script.

```sh
RAILS_ENV=test bin/rails db:drop db:create db:migrate
```

## March 16 2023

- TODO: summarise evening changes

- spike learning work to help create test with BDD and TDD
  1. create a branch ```git checkout -b spike/scaffold_teams```
  2. auto generate teams model with name and url ```sh
    rails generate scaffold teams name:string url:string --force --no-helper
    bin/rails db:migrate```
  3. ignore the Rails/I18nLocaleTexts for rubocop update `.rubocop_local.yml`
  4. create the feature test using binding.pry and IRB to build test functions noting you cna use the pending "message" as a holding point for passing test but acknowledging it is still broken

## March 15 2023

- add landing page title
  1. added a spec spec/features/add_team_url_spec.rb for title
  2. failure in running spec lead to adding "element" title to `spec/support/pages/landing.rb`
  3. failure in no title lead me to adding h1 with title text to `.../teams/index.html.erb`
  4. We have a title 👈🏼

- added first page
  1. added a spec spec/features/add_team_url_spec.rb
  2. added a Page Object Model spec/support/pages/landing.rb to access the root_url ie "/"
  3. failure in running spec lead to adding the root path in config/routes
  4. failure in no teams controller lead us to generating a controller

     ```sh
     bin/rails generate controller teams --no-helper
     ```

  5. failure in no index action lead me to add a `def index` method
  6. failure in no view lead me to creating a `.../teams/index.html.erb`
  7. success a blank page 🎉

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
