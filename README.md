# CryptoCommons

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/crypto_commons`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crypto_commons'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install crypto_commons

## Usage

require "crypto_commons"
> private_key can be any number between 0 and 2^256-1

private_key = 1729

> 02e670a0fb3a0c86f053523afb819b8944dc4013e9fd500371b1efe23e1f110637

public_key = CryptoCommons.public_key(private_key)

> f395247d6151b3f86049bb87aeb33da61e649920

public_key_160 = CryptoCommons.public_key_hash160(private_key)

> 1PCwsDm7qXL8ojaUdqiXhGnFFS62n2aZTP

address = CryptoCommons.address(private_key)

## What's next?

-> Support algorithms other than ECDSA

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/crypto_commons. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/crypto_commons/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CryptoCommons project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/crypto_commons/blob/master/CODE_OF_CONDUCT.md).
