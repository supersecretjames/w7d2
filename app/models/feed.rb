require 'open-uri'

class Feed < ActiveRecord::Base
  attr_accessible :source, :title

  validates :source, :title, :presence => true
  has_many :entries, :inverse_of => :feed

  def self.make_feed(source)
    feed = SimpleRSS.parse(open(source))
    Feed.new(source: source, title: feed.title)
  end

  def add_entries
    feed = SimpleRSS.parse(open(self.source))
    stored_guids = self.get_guids
    feed.entries.each do |params| #guid, title, description, link
      params = {
                :guid => params[:guid],
                :title => params[:title],
                :description => params[:description],
                :link => params[:link]
                }
      self.entries.build(params) unless stored_guids.has_key?(params[:guid])
    end
    self.save
  end

  def get_guids
    guids = {}
    self.entries.each {|entry| guids[entry[:guid]] = true } unless self.entries.count == 0
    guids
  end

end
