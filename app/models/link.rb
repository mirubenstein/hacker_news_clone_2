class Link < ActiveRecord::Base
  has_many :comments
  validates :url, :presence => true
end
