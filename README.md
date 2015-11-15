## Fyber API

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