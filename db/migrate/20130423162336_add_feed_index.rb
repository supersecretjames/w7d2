class AddFeedIndex < ActiveRecord::Migration
  def change
    add_index :entries, :feed_id
  end
end
