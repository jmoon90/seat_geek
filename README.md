# SeatGeek

Uses the SeatGeek Platform API to data around tickets in the USA.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'seat_geek'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seat_geek

## Usage


Taxonomies

```ruby
SeatGeek.get_taxonomies
# => GET http://api.seatgeek.com/2/taxonomies
```
Events (accepts five parameters or none)
```ruby
SeatGeek.get_events()
# => GET http://api.seatgeek.com/2/events

SeatGeek.get_events(month_of_the_year: '2016-03',
                    state: 'ny',
                    attendee_count: num,
                    event_type: 'taxonomie',
                    seat_geek_partner_id:)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmoon/seat_geek. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

please write tests with each pull request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

