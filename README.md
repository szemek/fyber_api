## Fyber API

[![Build Status](https://travis-ci.org/szemek/fyber_api.svg?branch=master)](https://travis-ci.org/szemek/fyber_api)
[![Code Climate](https://codeclimate.com/github/szemek/fyber_api/badges/gpa.svg)](https://codeclimate.com/github/szemek/fyber_api)
[![Test Coverage](https://codeclimate.com/github/szemek/fyber_api/badges/coverage.svg)](https://codeclimate.com/github/szemek/fyber_api/coverage)

Project uses Ruby 2.2.3 & Rails 4.2.5.

### Installation

```
bundle
cp .env.sample .env
```

Set `FYBER_API_KEY` in `.env`

### Starting up

```
bundle exec rails server
```

### Running tests

You can run:

```
rake
```

because `rspec-rails` sets `spec` as a `default` task (check → [rspec.rake](https://github.com/rspec/rspec-rails/blob/master/lib/rspec/rails/tasks/rspec.rake#L6))


### About project

#### Classes

There are 4 important classes:

  - `HashkeyCalculator` calculates SHA1 for provided `params` and `api_key`
  - `Api::Offer` fetches data from Fyber API
  - `OffersDecorator` transform data from `Api::Offer` into collection that will be used by view
  - `OffersController` combines all pieces, then renders view or redirects

#### Workflow

Baby steps. Small commits that introduce one cohesive chunk at a time.
I used set of favourite tools when implementing this project.

#### Code design

I strived for simple, readable code ([KISS](https://en.wikipedia.org/wiki/KISS_principle)), but I also tried to separate responsibility between classes ([Single Responsibility Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle)).
