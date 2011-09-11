class Enclosure < ActiveRecord::Base
	has_attached_file :enclosure 
	belongs_to :post
end
