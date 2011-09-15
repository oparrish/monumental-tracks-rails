class AlternativeEnclosure < ActiveRecord::Base
	has_attached_file :alternative,
										:storage => :s3, 
										:s3_credentials => {
											:access_key_id => ENV['S3_KEY'], 
											:secret_access_key => ENV['S3_SECRET']
										},
										:path => ":attachment/:id/:filename",
										:url => ":s3_alias_url",
										:s3_host_alias => ENV['S3_HOST_ALIAS']
	belongs_to :enclosure
	
	def file_name
		self.alternative_file_name
	end
	
	def url
		self.alternative.url
	end
end
