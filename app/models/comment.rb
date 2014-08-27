

class Comment < ActiveRecord::Base
  validates :text, :presence => true
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :link
end
