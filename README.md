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


Taxonomy

```ruby
taxonomy = SeatGeek::Taxonomy.new()

taxonomy.all
# => GET http://api.seatgeek.com/2/taxonomies

taxonomy.professional_sports
# 7 professional sports
# mlb
# nba
# nfl
# nhl
# mls
# pga
# mma


taxonomy.concerts
# 7 conerts related events
# classical
# theater
# concert
# music_festival is index
# comedy
# dance_performance_tour
# broadway_tickets_national
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmoon/seat_geek.

please write tests with each pull request

If you're lookig for features to work on, please check out https://github.com/jmoon90/seat_geek/issues

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

