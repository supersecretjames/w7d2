class Entry < ActiveRecord::Base
  attr_accessible :description, :guid, :link, :title, :feed_id

  validates :description, :guid, :link, :title, :feed, :presence => true
  # validates :guid, :uniqueness => true

  belongs_to :feed, :inverse_of => :entries
end
