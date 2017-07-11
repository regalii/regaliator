# Regaliator

Ruby wrapper for Regalii's API. The full API docs:
  * Version 3.2 (recommended): https://www.regalii.com/api/v3/overview ;
  * Version 3.1 : https://www.regalii.com/api/v3/overview ;
  * Version 3.0 : https://www.regalii.com/api/v3/overview ;
  * Version 1.5 : https://www.regalii.com/api/v1/overview

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'regaliator', github: 'regalii/regaliator'
```

And then execute:

```
$ bundle
```

## Configuration

Add the following to config/initializers/regaliator.rb:

```ruby
Regaliator.configure do |config|
  # Version target
  config.version      = '3.1'

  # Authentication settings
  config.api_key      = 'your-api-key'
  config.secret_key   = 'your-secret-key'

  # API host settings
  config.host         = 'api.casiregalii.com'
  config.open_timeout = 5
  config.read_timeout = 60
  config.use_ssl      = true

  # Proxy settings
  config.proxy_host   = nil
  config.proxy_port   = nil
  config.proxy_user   = nil
  config.proxy_pass   = nil
end
```

## Versions

To switch the version API, you have just to set the version in the configuration,
for instance, the version `1.5`:

```ruby
Regaliator.configure do |config|
  # Version target
  config.version = '1.5'

  # ...
end
```

The available versions are: `1.5`, `3.0`, `3.1` and `3.2`(recommended).

## Requests

**Success:**

```ruby
> response = Regaliator.bill.show(1)
> response.success?
=> true
> response.data
=> {...}
```

```ruby
> response = Regaliator.bill.pay(1, amount: 13.0, currency: 'MXN')
> response.success?
=> true
> response.data
=> {...}
```

**Failure:**

```ruby
> response = Regaliator.bill.pay(biller_id: 1, account_number: '12345', amount: 0.0, currency: 'MXN')
> response.success?
=> false
> response.data
=> {"code" => "R3", "message" => "Invalid Payment Amount"}
```

## Examples

The following examples will show how to use the Regaliator gem to connect to the different Regalii API endpoints.

### Billers List
https://www.regalii.com/billers
```ruby
response = Regaliator.biller.utilities
```

## Tests

To run the tests, run:
```
$ bundle exec rake test
```

To test on each file change, run:

```
$ bundle exec guard
```
