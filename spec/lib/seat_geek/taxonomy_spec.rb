require 'spec_helper'

describe SeatGeek::Taxonomy do
  describe '#all' do
    it 'should return all events taxonomy' do
      result = SeatGeek::Taxonomy.new.all
      expect(result["meta"]["total"]).to be_equal(61)
    end
  end

  describe '#professional_sports' do
    before(:each) do
      @professional = []
      profSports = [2,6,9,15,19,33,37]
      result = SeatGeek::Taxonomy.new.all["taxonomies"]

      profSports.each do |x|
        @professional << result[x]
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
    it 'should return concerts related events' do
      skip
      expect(1).to be_equal(2)
    end
  end

  describe '#minor_sports' do
    it 'should return minor sporting events' do
      skip
      expect(1).to be_equal(2)
    end
  end
end
