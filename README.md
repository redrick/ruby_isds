# RubyIsds [![wercker status](https://app.wercker.com/status/04043d3ae16228db7dc8d9d3ae51d1e6/s/master "wercker status")](https://app.wercker.com/project/byKey/04043d3ae16228db7dc8d9d3ae51d1e6)

Wrapper for API love [ISDS](https://www.datoveschranky.info/) shares with us through this XML API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_isds'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_isds

## Usage

Before usage please add config (for rails initializer) with following:

```ruby
RubyIsds.configure do |c|
  c.data_box = 'data_box_id'
  c.username = 'somebody'
  c.password = 'data_box_password'
  c.env = :development
end
```

you do not have to provide `env` in setup unless you go to production, gem
defaults to `:development` anyway...

This gem provides you with 2 basic classes and those are:
- `RubyIsds::DataBox` (operations and manipulation around data box itself)
- `RubyIsds::DataMessage` (operations and manipulation with message)

Their public API looks like so:

### RubyIsds::DataBox

#### .check

#### .find_by

#### .credit_info

#### .received

#### .sent

#### .state_changes


### RubyIsds::DataMessage

#### .find

#### #download
#### #verify
#### #authenticate
#### #signed
#### #author
#### #delivery_info
#### #envelope
#### #confirm_delivery
#### #mark_as_downloaded
#### #destroy
#### #sent?
#### #received?



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_isds. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## TODO

Still WIP although we test it already how this is going to turn out, so fingers
crossed... we still need to finish:
- massive portion of specs
- refactoring (a lot of same code and misused inheritance)
- sending messages...
- better documentation

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Thanks

Many thanks to Petr Písař <petr.pisar@atlas.cz> for writing awesome libisds C library and compiling many usefull information around ISDS :)

## Code of Conduct

Everyone interacting in the RubyIsds project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_isds/blob/master/CODE_OF_CONDUCT.md).
