class AddRank < ActiveRecord::Migration
  def change
    add_column :links, :rank, :integer
  end
end
