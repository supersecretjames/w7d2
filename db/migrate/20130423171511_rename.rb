class Rename < ActiveRecord::Migration
  def change
    rename_column :entries, :pubdate, :pubDate
  end
end
