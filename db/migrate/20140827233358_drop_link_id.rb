class DropLinkId < ActiveRecord::Migration
  def change
    remove_column :comments, :link_id
  end
end
