class Link < ActiveRecord::Base
	validates_presence_of :text, :url
end
