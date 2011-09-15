class Post < ActiveRecord::Base
	has_one :enclosure, :dependent => :destroy
	has_many :playlists, :dependent => :destroy
	
	accepts_nested_attributes_for :enclosure, :playlists, :allow_destroy => true
	
	validates_presence_of :title
end
