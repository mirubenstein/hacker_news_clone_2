require 'date'

class Link < ActiveRecord::Base
  has_many :comments, :as => :commentable
  validates :url, :presence => true

  scope :recent, -> { order("links.rank DESC").limit(20) }

  def self.calc_rank
    Link.all.each do |link|
      days_since = DateTime.now - link.created_at.to_datetime
      if days_since < 30
        new_rank = (0.3*link.votes) + (0.7*(30-days_since))
        link.update(:rank => new_rank)
      else
        link.update(:rank => 0)
      end
    end
  end

end
