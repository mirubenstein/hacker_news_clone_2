class DropPostVotes < ActiveRecord::Migration
  def change
    drop_table :posts, :votes
  end
end
