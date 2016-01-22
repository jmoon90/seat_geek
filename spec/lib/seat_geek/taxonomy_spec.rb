require 'spec_helper'

describe SeatGeek::Taxonomy do
  describe '.all' do
    it 'should return all events taxonomy' do
      result = SeatGeek::Taxonomy.new.all
      expect(result["meta"]["total"]).to be_equal(61)
    end
  end

  describe '.sports' do
    before(:each) do
      @sports = SeatGeek::Taxonomy.new.sports
    end

    it "returns 'sports' for name value" do
      expect(@sports.name).to eq('sports')
    end

    it 'contains sub_taxonomy' do
      expect(@sports.sub_taxonomies.count).to be > 0
    end
  end

  describe '.concerts' do
    before(:each) do
      @concerts = SeatGeek::Taxonomy.new.concert
    end

    it "returns 'concerts' for name value" do
      expect(@concerts.name).to eq('concert')
    end

    it 'contains sub_taxonomy' do
      expect(@concerts.sub_taxonomies.count).to be > 0
    end
  end

  describe '.theater' do
    before(:each) do
      @theater = SeatGeek::Taxonomy.new.theater
    end

    it "returns 'theater' for name value" do
      expect(@theater.name).to eq('theater')
    end

    it 'contains sub_taxonomy' do
      expect(@theater.sub_taxonomies.count).to be > 0
    end
  end

  private

  def get_events(event_ids)
    events = []

    result = SeatGeek::Taxonomy.new.all['taxonomies']

    event_ids.each do |x|
      events << result[x]
    end
    events
  end
end
