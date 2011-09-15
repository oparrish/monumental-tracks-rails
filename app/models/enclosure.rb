class Enclosure < ActiveRecord::Base
	has_attached_file :enclosure, 
										:storage => :s3, 
										:s3_credentials => {
											:access_key_id => ENV['S3_KEY'], 
											:secret_access_key => ENV['S3_SECRET']
										},
										:path => ":attachment/:id/:filename",
										:url => ":s3_alias_url",
										:s3_host_alias => ENV['S3_HOST_ALIAS']
	belongs_to :post
	has_many :alternative_enclosures, :dependent => :destroy
	
	accepts_nested_attributes_for :alternative_enclosures, :allow_destroy => true
	
	def file_name
		self.enclosure_file_name
	end
	
	def url
		self.enclosure.url
	end
end