class FeedController < ApplicationController
	def index
		@posts = Post.order("published_at DESC").find_all_by_published(true)
		
		# Set the content type to the standard one for RSS
		response.headers['Content-Type'] = 'application/rss+xml'
		# Render the feed using builder template
		render :action => 'rss', :layout => false
	end
end