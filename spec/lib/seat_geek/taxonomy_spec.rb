require 'spec_helper'

describe SeatGeek::Taxonomy do
  before(:each) do
    @result ||= SeatGeek::Taxonomy.new.all["taxonomies"]
  end

  describe '#all' do
    it 'should return all events taxonomy' do
      result = SeatGeek::Taxonomy.new.all
      expect(result["meta"]["total"]).to be_equal(61)
    end
  end

  describe '#professional_sports' do
    before(:each) do
      @professional = []
      prof_sports_id = [2,6,9,15,19,33,37]

      prof_sports_id.each do |x|
        @professional << @result[x]
      end
    end

    it 'returns mlb' do
      expect(@professional[0]["name"]).to eq('mlb')
    end
    it 'returns nfl' do
      expect(@professional[1]["name"]).to eq('nfl')
    end
    it 'returns nba' do
      expect(@professional[2]["name"]).to eq('nba')
    end
    it 'returns nhl' do
      expect(@professional[3]["name"]).to eq('nhl')
    end
    it 'returns mls' do
      expect(@professional[4]["name"]).to eq('mls')
    end
    it 'returns pga' do
      expect(@professional[5]["name"]).to eq('pga')
    end
    it 'returns mma' do
      expect(@professional[6]["name"]).to eq('mma')
    end
    it 'should return 7 professional sporting events' do
      expect(@professional.count).to eq(7)
    end
  end

  describe '#concerts' do
    before(:each) do
      @concerts = []
      concerts_ids = [46, 47, 48, 40, 54, 55, 57,]

      concerts_ids.each do |x|
        @concerts << @result[x]
      end
    end

    it 'return concerts' do
      expect(@concerts[0]["name"]).to eq('concert')
    end

    it 'return music_festival' do
      expect(@concerts[1]["name"]).to eq('music_festival')
    end

    it 'return concerts theater' do
      expect(@concerts[2]["name"]).to eq('theater')
    end

    it 'return tennis' do
      expect(@concerts[3]["name"]).to eq('tennis')
    end

    it 'return broadway_tickets_national' do
      expect(@concerts[4]["name"]).to eq('broadway_tickets_national')
    end

    it 'return comedy' do
      expect(@concerts[5]["name"]).to eq('comedy')
    end

    it 'return dance_performance_tour' do
      expect(@concerts[6]["name"]).to eq('dance_performance_tour')
    end

    it 'should return 7 concert events' do
      expect(@concerts.count).to eq(7)
    end
  end

  #TODO
  describe '#minor_league_sports' do
    before(:each) do
      # @minor = []
      # minorSports = [2,6,9,15,19,33,37]
      # result = SeatGeek::Taxonomy.new.all["taxonomies"]
      #
      # minorSports.each do |x|
      #   @minor << result[x]
      # end
    end

#minor_league_baseball is index 4
#minor_league_hockey is index 17
#nba_dleague is index 13

    it 'should return minor sporting events' do
      skip
      expect(1).to be_equal(2)
    end
  end
end
