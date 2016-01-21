# Regaliator

Ruby wrapper for Regalii's API. The full API docs can be found at https://www.regalii.com/api/overview

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'regaliator', github: 'regalii/regaliator'
```

And then execute:

    $ bundle

## Configuration

Add the following to config/initializers/regaliator.rb:

```ruby
  Regaliator.configuration do |config|
    # Authentication settings
    config.api_key      = 'your-api-key'
    config.secret_key   = 'your-secret-key'

    # API host settings
    config.host         = 'api.casiegalii.com'
    config.open_timeout = 5
    config.read_timeout = 10
    config.use_ssl      = true

    # Proxy settings
    config.proxy_host   = nil
    config.proxy_port   = nil
    config.proxy_user   = nil
    config.proxy_pass   = nil
  end
```

## Requests

**Success:**

```ruby
> response = Regaliator::Bill.consult(biller_id: 1, account_number: '12345')
> response.success?
=> true
> response.data
=> {...}
```

```ruby
> response = Regaliator::Bill.pay(biller_id: 1, account_number: '12345', amount: 13.0, currency: 'MXN')
> response.success?
=> true
> response.data
=> {...}
```

**Failure:**

```ruby
> response = Regaliator::Bill.pay(biller_id: 1, account_number: '12345', amount: 0.0, currency: 'MXN')
> response.success?
=> false
> response.data
=> {"code" => "R3", "message" => "Invalid Payment Amount"}
```
