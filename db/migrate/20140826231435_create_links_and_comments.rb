class CreateLinksAndComments < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :votes, default: 0
      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :link
      t.text :text
      t.timestamps
    end
  end
end
