class Post < ActiveRecord::Base
	has_many :enclosures, :dependent => :destroy
	has_many :playlists, :dependent => :destroy
	
	accepts_nested_attributes_for :enclosures, :playlists, :allow_destroy => true
	
	validates_presence_of :title, :body
end
