# Work in Progress

# RubyIsds [![wercker status](https://app.wercker.com/status/04043d3ae16228db7dc8d9d3ae51d1e6/s/master "wercker status")](https://app.wercker.com/project/byKey/04043d3ae16228db7dc8d9d3ae51d1e6) [![Maintainability](https://api.codeclimate.com/v1/badges/eb20cde530fb8d1690cd/maintainability)](https://codeclimate.com/github/redrick/ruby_isds/maintainability)

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

Before usage please add config (for rails initializer) with one of supported
auth strategies:

### Username + password

```ruby
RubyIsds.configure do |c|
  c.data_box = 'data_box_id'
  c.username = 'somebody'
  c.password = 'data_box_password'
  c.env = :development
end
```
### Server side system certificate

```ruby
RubyIsds.configure do |c|
  c.data_box = 'data_box_id'
  c.cert_file = 'spec/factories/files/certifikat.pem'
  c.key_file = 'spec/factories/files/test-key.key'
  c.pass_phrase = 'andrej'
  c.env = :development
end
```
here `data_box_id` if id of databox you will be accessing, you do not really
need id of databox used as point from where you access

you do not have to provide `env` in setup unless you go to production, gem
defaults to `:development` anyway...

This gem provides you with 2 basic classes and those are:
- `RubyIsds::DataBox` (operations and manipulation around data box itself)
- `RubyIsds::DataMessage` (operations and manipulation with message)

Kinda important to mention is that results of calls are trying to be the same each time of course and in form of neat object that looks like this:

```ruby
=> #<RubyIsds::WebServices::DbSearch::Response:0x00007fd3d44f0fd8
 @body=#<RubyIsds::Responses::Db::Body:0x00007fd3d449b808 @ciRecords=nil, @currentCredit="596400", @notifEmail=nil>,
 @response=
  {"Envelope"=>
    {"xmlns:SOAP_ENV"=>"http://schemas.xmlsoap.org/soap/envelope/",
     "xmlns:xsd"=>"http://www.w3.org/2001/XMLSchema",
     "Body"=>{"DataBoxCreditInfoResponse"=>{"xmlns:p"=>"http://isds.czechpoint.cz/v20", "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance", "currentCredit"=>"596400", "notifEmail"=>{"xsi:nil"=>"true"}, "ciRecords"=>nil, "dbStatus"=>{"dbStatusCode"=>"0000", "dbStatusMessage"=>"Provedeno úspěšně."}}}}},
 @status=#<RubyIsds::Responses::Db::Status:0x00007fd3d449be48 @code="0000", @message="Provedeno úspěšně.">>
```

To take it apart consist of:
- `body` -> in case of request for messages will be `messages` is parsed body taking original attribute names and their values
  - inspect and use like so:
  ```ruby
  > result.body.currentCredit
  => "596400"
  ```
- `status` -> always contains status information in form of `code` and `messsage`
- `response` -> simply whole original XML response parsed into Hash for better usage

Public API looks like so:

### RubyIsds::DataBox

#### .check

checking the status

```ruby
> RubyIsds::DataBox.check

=> #<RubyIsds::WebServices::DbSearch::Response:0x00007fd3d68487d8
 @body=#<RubyIsds::Responses::Db::Body:0x00007fd3d41ad2e0 @dbState="1">,
 @response=
  {"Envelope"=>
    {"xmlns:SOAP_ENV"=>"http://schemas.xmlsoap.org/soap/envelope/",
     "xmlns:xsd"=>"http://www.w3.org/2001/XMLSchema",
     "Body"=>{"CheckDataBoxResponse"=>{"xmlns:p"=>"http://isds.czechpoint.cz/v20", "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance", "dbState"=>"1", "dbStatus"=>{"dbStatusCode"=>"0000", "dbStatusMessage"=>"Provedeno úspěšně."}}}}},
 @status=#<RubyIsds::Responses::Db::Status:0x00007fd3d41ae280 @code="0000", @message="Provedeno úspěšně.">>
```


#### .find_by

You can find any data box by searching like so:

```ruby
> RubyIsds::DataBox.find_by(dbType: 'FO', pnLastName: 'Anta')

=> #<RubyIsds::WebServices::DbSearch::Response:0x00007f9986b4c090
 @body=#<RubyIsds::Responses::Db::Body:0x00007f9987823f98 @dbResults=false>,
 @response=
  {"Envelope"=>
    {"xmlns:SOAP_ENV"=>"http://schemas.xmlsoap.org/soap/envelope/",
     "xmlns:xsd"=>"http://www.w3.org/2001/XMLSchema",
     "Body"=>
      {"FindDataBoxResponse"=>
        {"xmlns:p"=>"http://isds.czechpoint.cz/v20",
         "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
         "dbResults"=>
          {"dbOwnerInfo"=>
            {"dbID"=>"mxbf8u6",
             "dbType"=>"FO",
             "ic"=>{"xsi:nil"=>"true"},
             "pnFirstName"=>"Andrej",
             "pnMiddleName"=>{"xsi:nil"=>"true"},
             "pnLastName"=>"Antaš",
             "pnLastNameAtBirth"=>{"xsi:nil"=>"true"},
             "firmName"=>{"xsi:nil"=>"true"},
             "biDate"=>"1990-01-16",
             "biCity"=>"*",
             "biCounty"=>"*",
             "biState"=>"*",
             "adCity"=>"Praha 5",
             "adStreet"=>"Pekařská",
             "adNumberInStreet"=>"10a",
             "adNumberInMunicipality"=>"695",
             "adZipCode"=>"15500",
             "adState"=>"CZ",
             "nationality"=>"*",
             "identifier"=>{"xsi:nil"=>"true"},
             "registryCode"=>{"xsi:nil"=>"true"},
             "dbState"=>"1",
             "dbEffectiveOVM"=>"false",
             "dbOpenAddressing"=>"true"}},
         "dbStatus"=>{"dbStatusCode"=>"0000", "dbStatusMessage"=>"Provedeno úspěšně."}}}}},
 @status=#<RubyIsds::Responses::Db::Status:0x00007f9987828c50 @code="0000", @message="Provedeno úspěšně.">>
 ```

#### .credit_info

For checking your balance (post messages need payments), so you can make sure you have enough before sending a message:

```ruby
> RubyIsds::DataBox.credit_info

=> #<RubyIsds::WebServices::DbSearch::Response:0x00007f8dd69b6e08
 @body=#<RubyIsds::Responses::Db::Body:0x00007f8dd699c1e8 @ciRecords=nil, @currentCredit="596400", @notifEmail=nil>,
 @response=
  {"Envelope"=>
    {"xmlns:SOAP_ENV"=>"http://schemas.xmlsoap.org/soap/envelope/",
     "xmlns:xsd"=>"http://www.w3.org/2001/XMLSchema",
     "Body"=>{"DataBoxCreditInfoResponse"=>{"xmlns:p"=>"http://isds.czechpoint.cz/v20", "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance", "currentCredit"=>"596400", "notifEmail"=>{"xsi:nil"=>"true"}, "ciRecords"=>nil, "dbStatus"=>{"dbStatusCode"=>"0000", "dbStatusMessage"=>"Provedeno úspěšně."}}}}},
 @status=#<RubyIsds::Responses::Db::Status:0x00007f8dd699c3a0 @code="0000", @message="Provedeno úspěšně.">>
```

#### .received

Listing all received messages:

```ruby
> RubyIsds::DataBox.received

=> #<RubyIsds::Responses::Messages::Collection:0x00007f99882e6048
 @messages=
  [
  ...
  ],
 @status=#<RubyIsds::Responses::Dm::Status:0x00007f9986c26718 @code="0000", @message="Provedeno úspěšně.">>
```

Message responses are stubbed here in response, will be explain down in DataMessage docs

#### .sent


Listing all received messages:

```ruby
> RubyIsds::DataBox.sent

=> #<RubyIsds::Responses::Messages::Collection:0x00007f99882e6048
 @messages=
  [
  ...
  ],
 @status=#<RubyIsds::Responses::Dm::Status:0x00007f9986c26718 @code="0000", @message="Provedeno úspěšně.">>
```

Message responses are stubbed here in response, will be explain down in DataMessage docs

#### .state_changes

TODO

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

### Help

If in doubt, or my so called 'README' seems not that helpful, please refer to [ISDS provozni rad](https://www.datoveschranky.info/dulezite-informace/provozni-rad-isds)

#### Certificates

Just some helpfull information when you want to use certificate to access
databoxes:

How to setup and what not in ISDS: [https://www.czebox.cz/static/ISDS/help/page8.html#8_4](https://www.czebox.cz/static/ISDS/help/page8.html#8_4)

Working with DER/PEM and what not around the keys: [https://knowledge.digicert.com/solution/SO26449.html](https://knowledge.digicert.com/solution/SO26449.html)

How to convert windows pfx file exported from keychain into key you need here: [https://www.markbrilman.nl/2011/08/howto-convert-a-pfx-to-a-seperate-key-crt-file/](https://www.markbrilman.nl/2011/08/howto-convert-a-pfx-to-a-seperate-key-crt-file/)

Jus to note here, certificate accepted should be in PEM format and you have to add the private.key with the password to it.

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
