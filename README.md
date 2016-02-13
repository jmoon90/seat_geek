# SeatGeek
[![Gem Version](https://badge.fury.io/rb/seat_geek.svg)](https://badge.fury.io/rb/seat_geek) [![Build Status](https://travis-ci.org/jmoon90/seat_geek.svg)](https://travis-ci.org/jmoon90/seat_geek) [![Code Climate](https://codeclimate.com/github/jmoon90/seat_geek.svg)](https://codeclimate.com/github/jmoon90/seat_geek)


Uses the SeatGeek Platform API to data around tickets in the USA.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'seat_geek'
```

Or install it yourself as:

    $ gem install seat_geek

## Usage

Events
```ruby
SeatGeek.get_events()
# => GET http://api.seatgeek.com/2/events

Accepts 1 parameter

params = { travel_dates: {arrive: '2016-03-15', depart: '2016-03-19', datetime_type: 'utc'},
           state: 'ny', #either state or city
           city: 'new-york-city', #either state or city
           attendee_count: num,
           event_type: 'taxonomie',
           seat_geek_partner_id: 1234,
         }
SeatGeek.get_events(params)

------

SeatGeek.get_event(id:)
# => GET http://api.seatgeek.com/2/events/:id

Accepts 1 integer
```


Taxonomy

```ruby
taxonomy = SeatGeek.get_taxonomies

taxonomy.sports
# Events that contains parent_id of 1000000
#=> <SeatGeek::Taxonomies::Sports: @parent_object={ ... },
                                   @sub_taxonomies= [{"parent_id"=>1000000, "id"=>1010100, "name"=>"mlb"} ..]

callable methods
taxonomy.sports.
  - all
  - baseball
  - basketball
  - hockey
  - football
  - auto_racing
  - golf
  - fighting
  - tennis
  - animal_sports
  - extreme_sports
  - olympic_sports

taxonomy.concert
# Events that contains parent_id of 2000000
#=> <SeatGeek::Taxonomies::Concert: @parent_object={ ... },
                                   @sub_taxonomies= [{"parent_id"=>2000000, "id"=>2010000, "name"=>"music_festival"} ..]

callable methods
taxonomy.concert.
  - all
  - music_festival

taxonomy.theater
# Events that contains parent_id of 3000000
#=> <SeatGeek::Taxonomies::Theater: @parent_object={ ... },
                                   @sub_taxonomies= [{"parent_id"=>3000000, "id"=>3020000, "name"=>"cirque_du_soleil"} ..]

taxonomy.theater.
  - all
  - classical

taxonomy
# => GET http://api.seatgeek.com/2/taxonomies
#=> contains all of the above
```

## TODO Implementation


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmoon/seat_geek.

please write tests with each pull request

If you're lookig for features to work on, please check out https://github.com/jmoon90/seat_geek/issues

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

