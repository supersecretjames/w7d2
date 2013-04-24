class RemoveDateTime < ActiveRecord::Migration
  def change
    remove_column :entries, :datetime
    remove_column :entries, :pubDate
    add_column :entries, :pubDate, :datetime
  end
end
