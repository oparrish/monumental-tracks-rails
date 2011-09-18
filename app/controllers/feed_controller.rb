class FeedController < ApplicationController
	def index
		@posts = Post.find_all_by_published(true).order("published_at DESC")
		
		# Title for the RSS feed
		@feed_title = "Monumental Tracks"
		# Get the absolute URL which produces the feed
		@feed_url = "http://localhost:5000/feed"
		# Description of the feed as a whole
		@feed_description = "Monumental Tracks"
		# Set the content type to the standard one for RSS
		response.headers['Content-Type'] = 'application/rss+xml'
		# Render the feed using builder template
		render :action => 'rss', :layout => false
	end
end