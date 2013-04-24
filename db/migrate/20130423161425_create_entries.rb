class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :link
      t.text :description
      t.string :comments
      t.string :pubdate
      t.string :datetime
      t.string :guid
      t.references :feed

      t.timestamps
    end
    add_index :entries, :guid, :unique => true
  end

end
