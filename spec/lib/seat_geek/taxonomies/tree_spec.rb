require 'spec_helper'

describe SeatGeek::Taxonomies::Tree do
  SPORTS_ID = 1000000
  CONCERT_ID = 2000000
  THEATRE_ID = 3000000

  describe 'public methods ' do
    before(:each) do
      @tree ||= SeatGeek::Taxonomies::Tree.new(parent_ids: [SPORTS_ID, CONCERT_ID, THEATRE_ID], taxonomies: taxonomies)
    end

    describe '.all' do
      it 'responds to sports' do
        expect(@tree.all.keys.include?(:sports)).to be true
        expect(@tree.all.keys.include?(:theater)).to be true
        expect(@tree.all.keys.include?(:concert)).to be true
      end

      describe '.sports' do
        it 'returns all sporting taxonomy' do
          sports = @tree.sports
          expect(sports.class).to eq(SeatGeek::Taxonomies::Sports)
        end
      end

      describe '.concert' do
        it 'returns all concert taxonomy' do
          concert = @tree.concert
          expect(concert.class).to eq(SeatGeek::Taxonomies::Concert)
        end
      end

      describe '.theater' do
        it 'returns all theater taxonomy' do
          theater = @tree.theater
          expect(theater.class).to eq(SeatGeek::Taxonomies::Theater)
        end
      end
    end
  end

  describe 'private methods' do
    before(:each) do
      tree ||= SeatGeek::Taxonomies::Tree.new(parent_ids: [SPORTS_ID, CONCERT_ID, THEATRE_ID], taxonomies: taxonomies)
      @finished_tree = tree.send(:finished_tree)
    end
    describe '.finished_tree' do
      it 'fills out sub_taxonomy when class is intantiated' do
        expect(@finished_tree.keys).to eq([:sports, :concert, :theater])
      end

      describe 'sport' do
        it 'sports key returns sports class' do
          expect(@finished_tree[:sports].class).to eq(SeatGeek::Taxonomies::Sports)
        end
      end

      describe 'concert' do
        it 'concert key returns concert class' do
          expect(@finished_tree[:concert].class).to eq(SeatGeek::Taxonomies::Concert)
        end
      end

      describe 'theater' do
        it 'theater key returns theater class' do
          expect(@finished_tree[:theater].class).to eq(SeatGeek::Taxonomies::Theater)
        end
      end
    end
  end

  def taxonomies
    [{"parent_id"=>nil, "id"=>1000000, "name"=>"sports"}, {"parent_id"=>1000000,
    "id"=>1010000, "name"=>"baseball"}, {"parent_id"=>1010000, "id"=>1010100,
    "name"=>"mlb"}, {"parent_id"=>1010000, "id"=>1010200,
    "name"=>"ncaa_baseball"}, {"parent_id"=>1010000, "id"=>1010300,
    "name"=>"minor_league_baseball"}, {"parent_id"=>1000000, "id"=>1020000,
    "name"=>"football"}, {"parent_id"=>1020000, "id"=>1020100, "name"=>"nfl"},
    {"parent_id"=>1020000, "id"=>1020200, "name"=>"ncaa_football"},
    {"parent_id"=>1000000, "id"=>1030000, "name"=>"basketball"},
    {"parent_id"=>1030000, "id"=>1030100, "name"=>"nba"}, {"parent_id"=>1030000,
    "id"=>1030200, "name"=>"ncaa_basketball"}, {"parent_id"=>1030000,
    "id"=>1030300, "name"=>"ncaa_womens_basketball"}, {"parent_id"=>1030000,
    "id"=>1030400, "name"=>"wnba"}, {"parent_id"=>1030000, "id"=>1030500,
    "name"=>"nba_dleague"}, {"parent_id"=>1000000, "id"=>1040000,
    "name"=>"hockey"}, {"parent_id"=>1040000, "id"=>1040100, "name"=>"nhl"},
    {"parent_id"=>1040000, "id"=>1040200, "name"=>"ncaa_hockey"},
    {"parent_id"=>1040000, "id"=>1040300, "name"=>"minor_league_hockey"},
    {"parent_id"=>1000000, "id"=>1050000, "name"=>"soccer"},
    {"parent_id"=>1050000, "id"=>1050100, "name"=>"mls"}, {"parent_id"=>1050000,
    "id"=>1050200, "name"=>"ncaa_soccer"}, {"parent_id"=>1050000, "id"=>1050300,
    "name"=>"european_soccer"}, {"parent_id"=>1050000, "id"=>1050400,
    "name"=>"international_soccer"}, {"parent_id"=>1050400, "id"=>1050401,
    "name"=>"world_cup"}, {"parent_id"=>1000000, "id"=>1060000,
    "name"=>"auto_racing"}, {"parent_id"=>1060000, "id"=>1060100,
    "name"=>"nascar"}, {"parent_id"=>1060100, "id"=>1060101,
    "name"=>"nascar_sprintcup"}, {"parent_id"=>1060100, "id"=>1060102,
    "name"=>"nascar_nationwide"}, {"parent_id"=>1060000, "id"=>1060200,
    "name"=>"indycar"}, {"parent_id"=>1060000, "id"=>1060300, "name"=>"f1"},
    {"parent_id"=>1060000, "id"=>1060400, "name"=>"monster_truck"},
    {"parent_id"=>1060000, "id"=>1060500, "name"=>"motocross"},
    {"parent_id"=>1000000, "id"=>1070000, "name"=>"golf"}, {"parent_id"=>1070000,
    "id"=>1070100, "name"=>"pga"}, {"parent_id"=>1070000, "id"=>1070200,
    "name"=>"lpga"}, {"parent_id"=>1000000, "id"=>1080000, "name"=>"fighting"},
    {"parent_id"=>1080000, "id"=>1080100, "name"=>"boxing"},
    {"parent_id"=>1080000, "id"=>1080200, "name"=>"mma"}, {"parent_id"=>1080000,
    "id"=>1080300, "name"=>"wrestling"}, {"parent_id"=>1080300, "id"=>1080301,
    "name"=>"wwe"}, {"parent_id"=>1000000, "id"=>1090000, "name"=>"tennis"},
    {"parent_id"=>1000000, "id"=>1100000, "name"=>"animal_sports"},
    {"parent_id"=>1100000, "id"=>1100100, "name"=>"horse_racing"},
    {"parent_id"=>1100000, "id"=>1100200, "name"=>"rodeo"}, {"parent_id"=>1000000,
    "id"=>1110000, "name"=>"extreme_sports"}, {"parent_id"=>1000000,
    "id"=>1120000, "name"=>"olympic_sports"}, {"parent_id"=>nil, "id"=>2000000,
    "name"=>"concert"}, {"parent_id"=>2000000, "id"=>2010000,
    "name"=>"music_festival"}, {"parent_id"=>nil, "id"=>3000000,
    "name"=>"theater"}, {"parent_id"=>3000000, "id"=>3010000,
    "name"=>"classical"}, {"parent_id"=>3010000, "id"=>3010100,
    "name"=>"classical_opera"}, {"parent_id"=>3010000, "id"=>3010200,
    "name"=>"classical_vocal"}, {"parent_id"=>3010000, "id"=>3010300,
    "name"=>"classical_orchestral_instrumental"}, {"parent_id"=>3000000,
    "id"=>3020000, "name"=>"cirque_du_soleil"}, {"parent_id"=>3000000,
    "id"=>3030000, "name"=>"broadway_tickets_national"}, {"parent_id"=>3000000,
    "id"=>3040000, "name"=>"comedy"}, {"parent_id"=>3000000, "id"=>3050000,
    "name"=>"family"}, {"parent_id"=>3000000, "id"=>3060000,
    "name"=>"dance_performance_tour"}, {"parent_id"=>3000000, "id"=>3070000,
    "name"=>"film"}, {"parent_id"=>3000000, "id"=>3080000, "name"=>"literary"},
    {"parent_id"=>3000000, "id"=>3090000, "name"=>"circus"}]
  end
end
