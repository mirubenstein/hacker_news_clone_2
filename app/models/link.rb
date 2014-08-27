class Link < ActiveRecord::Base
  has_many :comments, :as => :commentable
  validates :url, :presence => true
end
