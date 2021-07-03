# Country Manager

This project is a test for manage the countries supplied by an external API.
```bash
  https://restcountries.eu/rest/v2/all
```
You can see the app in procuction here:
[Country Manager App](http://country-manager.herokuapp.com/)

## Setup

Just run the bin setup, is required MONGODB:

```bash
  bin/setup
```
or

```bash
  bundle install
  yarn install --check-files
```

To run the app:

```bash
  cp .env.example .env
  source .env
  and
  rails server
```

## Validation:💎

for validation of unit tests run:

```ruby
  bundle exec rspec
```

for validation of rubocop linter run:

```ruby
  rubocop
```

## check use:💎

*registration/login:
```bash
  the user be able to crate an account and also a login
```

*CRUD COUNTRIES:
```bash
- The user be able to administrate data supplied by an external API
```
