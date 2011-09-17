require 'chronic'

class Post < ActiveRecord::Base
	has_one :enclosure, :dependent => :destroy
	has_many :playlists, :dependent => :destroy
	
	accepts_nested_attributes_for :enclosure, :playlists, :allow_destroy => true
	
	validates_presence_of :title

	def published_at_str
    published_at.to_s(:db)  
  end  
  
  def published_at_str=(published_at_str)  
    self.published_at = Chronic.parse(published_at_str)  
  end  
end
