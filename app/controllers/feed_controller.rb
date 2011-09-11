class FeedController < ApplicationController
	def index
		@posts = Post.find_all_by_published(true, :limit => 10)
		
		# Title for the RSS feed
		@feed_title = Setting.find_by_key("title").value
		# Get the absolute URL which produces the feed
		@feed_url = "http://localhost:3000/feed"
		# Description of the feed as a whole
		@feed_description = Setting.find_by_key("description").value
		# Set the content type to the standard one for RSS
		response.headers['Content-Type'] = 'application/rss+xml'
		# Render the feed using builder template
		render :action => 'rss', :layout => false
	end
end