require 'spec_helper'

describe 'seat_geek' do
  describe '.get_event' do
    before(:each) do
      options = {travel_dates: {arrive: '2016-03-01', depart: '2016-03-28'}, state: 'ny', attendee_count: '2', event_type: 'nba' }
      @result ||= SeatGeek.get_events(options)['events']
    end
    it 'doesnt require params and contains events' do
      expect(@result.count).to be > 1
    end

    it 'should return new york as state' do
      expect(@result.first["venue"]["state"]).to match(/NY/)
    end

    it 'should return more than 2 listing_count' do
      expect(@result.first["stats"]["listing_count"]).to be >= 2
    end

    it 'should return december as month' do
      expect(@result.first["datetime_utc"]).to match(/2016-03/)
    end

    it 'should return nba event' do
      expect(@result.first['type']).to match(/nba/)
    end
  end

  describe '.get_event' do
    before(:each) do
      VCR.use_cassette('seat_geek_get_event', :record => :new_episodes) do
        @result ||= SeatGeek.get_event(id: 3085319)
      end
    end

    it 'returns event with id 3085319' do
      expect(@result['id']).to be == 3085319
    end

    it 'returns average price for event' do
      expect(@result['stats'].keys.include?('average_price')).to be true
    end

    it 'returns lowest price for event' do
      expect(@result['stats'].keys.include?('lowest_price')).to be true
    end

    it 'returns title for event' do
      expect(@result['title']).to be == 'Kalendr'
    end

    it 'returns score for event' do
      expect(@result.keys.include?('score')).to be true
    end
  end

  describe '.get_taxonomies' do
    before(:each) do
      @taxonomies = SeatGeek.get_taxonomies
    end

    describe '.sports' do
      it 'has all' do
        expect(@taxonomies.sports.respond_to?(:all)).to be true
        expect(@taxonomies.sports.all.count).to be == 46
      end

      it 'contains baseball' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'baseball' }
        expect(result).to be true
      end

      it 'contains basketball' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'basketball' }
        expect(result).to be true
      end

      it 'contains mlb' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'mlb' }
        expect(result).to be true
      end

      it 'contains ncaa_soccer' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'ncaa_soccer' }
        expect(result).to be true
      end

      it 'contains ncaa_hockey' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'ncaa_hockey' }
        expect(result).to be true
      end

      it 'contains ncaa_womens_basketball' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'ncaa_womens_basketball' }
        expect(result).to be true
      end

      it 'contains ncaa_football' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'ncaa_football' }
        expect(result).to be true
      end

      it 'contains ncaa_baseball' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'ncaa_baseball' }
        expect(result).to be true
      end

      it 'contains minor_league_hockey' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'minor_league_hockey' }
        expect(result).to be true
      end

      it 'contains minor_league_baseball' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'minor_league_baseball' }
        expect(result).to be true
      end

      it 'contains football' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'football' }
        expect(result).to be true
      end

      it 'contains nba' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'nba' }
        expect(result).to be true
      end

      it 'contains ncaa_basketball' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'ncaa_basketball' }
        expect(result).to be true
      end

      it 'contains nfl' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'nfl' }
        expect(result).to be true
      end

      it 'contains wnba' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'wnba' }
        expect(result).to be true
      end

      it 'contains nba_dleague' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'nba_dleague' }
        expect(result).to be true
      end

      it 'contains hockey' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'hockey' }
        expect(result).to be true
      end

      it 'contains nhl' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'nhl' }
        expect(result).to be true
      end

      it 'contains minor_league_hockey' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'minor_league_hockey' }
        expect(result).to be true
      end

      it 'contains soccer' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'soccer' }
        expect(result).to be true
      end

      it 'contains mls' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'mls' }
        expect(result).to be true
      end

      it 'contains european_soccer' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'european_soccer' }
        expect(result).to be true
      end

      it 'contains international_soccer' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'international_soccer' }
        expect(result).to be true
      end

      it 'contains world_cup' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'world_cup' }
        expect(result).to be true
      end

      it 'contains auto_racing' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'auto_racing' }
        expect(result).to be true
      end

      it 'contains nascar' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'nascar' }
        expect(result).to be true
      end

      it 'contains nascar_sprintcup' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'nascar_sprintcup' }
        expect(result).to be true
      end

      it 'contains indycar' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'indycar' }
        expect(result).to be true
      end

      it 'contains f1' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'f1' }
        expect(result).to be true
      end

      it 'contains monster_truck' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'monster_truck' }
        expect(result).to be true
      end

      it 'contains motocross' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'motocross' }
        expect(result).to be true
      end

      it 'contains golf' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'golf' }
        expect(result).to be true
      end

      it 'contains pga' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'pga' }
        expect(result).to be true
      end

      it 'contains lpga' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'lpga' }
        expect(result).to be true
      end

      it 'contains fighting' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'fighting' }
        expect(result).to be true
      end

      it 'contains boxing' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'boxing' }
        expect(result).to be true
      end

      it 'contains mma' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'mma' }
        expect(result).to be true
      end

      it 'contains wrestling' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'wrestling' }
        expect(result).to be true
      end

      it 'contains wwe' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'wwe' }
        expect(result).to be true
      end

      it 'contains tennis' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'tennis' }
        expect(result).to be true
      end

      it 'contains animal_sports' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'animal_sports' }
        expect(result).to be true
      end

      it 'contains horse_racing' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'horse_racing' }
        expect(result).to be true
      end

      it 'contains rodeo' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'rodeo' }
        expect(result).to be true
      end

      it 'contains extreme_sports' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'extreme_sports' }
        expect(result).to be true
      end

      it 'contains olympic_sports' do
        result = false
        @taxonomies.sports.all.detect { |t| result = true if t['name'] == 'olympic_sports' }
        expect(result).to be true
      end
    end

    describe '.concert' do
      it 'has all' do
        expect(@taxonomies.concert.respond_to?(:all)).to be true
        expect(@taxonomies.concert.all.count).to be == 2
      end

      it 'contains music festival'do
        expect(@taxonomies.concert.respond_to?(:music_festival)).to be true
      end
    end

    describe '.theater' do
      it 'has all' do
        expect(@taxonomies.theater.respond_to?(:all)).to be true
        expect(@taxonomies.theater.all.count).to be == 13
      end

      it 'contains classical'do
        expect(@taxonomies.theater.respond_to?(:classical)).to be true
        expect(@taxonomies.theater.classical.count).to be == 4
      end

      it 'contains classical_opera'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'classical_opera' }
      end
      it 'contains classical_vocal'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'classical_vocal' }
      end
      it 'contains classical_orchestral_instrumental'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'classical_orchestral_instrumental' }
      end

      it 'contains classical'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'classical' }
      end

      it 'contains circus'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'circus' }
      end

      it 'contains cirque_du_soleil'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'cirque_du_soleil' }
      end

      it 'contains broadway_tickets_national'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'broadway_tickets_national' }
      end

      it 'contains comedy'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'comedy' }
      end

      it 'contains family'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'family' }
      end

      it 'contains dance_performance_tour'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'dance_performance_tour' }
      end

      it 'contains film'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'film' }
      end

      it 'contains literary'do
        @taxonomies.theater.all.detect { |t| result = true if t['name'] == 'literary' }
      end
    end
  end
end
