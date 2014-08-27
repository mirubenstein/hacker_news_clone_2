require 'rails_helper'

describe Link do
  it { should validate_presence_of :url }
  it { should have_many :comments }


describe '.calc_rank' do
    it "assigns rank to all Link objects" do
      link = Link.create(:url => "www.google.com", :description => "google", :created_at => "2014-07-01T04:05:06+07:00")
      valid_link = Link.create(:url => "www.animal.com", :description => "Animal Planet", :created_at => "2014-08-01T04:05:06+07:00")
      another_valid_link = Link.create(:url => "www.cool.com", :description => "Cool", :created_at => "2014-08-15T04:05:06+07:00")
      Link.calc_rank
      link.reload
      valid_link.reload
      another_valid_link.reload
      expect(link.rank).to eq 0
      expect(valid_link.rank).to eq 2
      expect(another_valid_link.rank).to eq 11
    end
  end

  describe 'recent' do
    it "returns the most recent urls according to rank" do
      link = Link.create(:url => "www.google.com", :description => "google", :created_at => "2014-07-01T04:05:06+07:00")
      valid_link = Link.create(:url => "www.animal.com", :description => "Animal Planet", :created_at => "2014-08-01T04:05:06+07:00")
      another_valid_link = Link.create(:url => "www.cool.com", :description => "Cool", :created_at => "2014-08-15T04:05:06+07:00")
      Link.calc_rank
binding.pry
      expect(Link.recent).to eq [another_valid_link, valid_link, link]
    end
  end
end
