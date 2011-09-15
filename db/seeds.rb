# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rexml/document'

puts "Deleting links..."
Link.all.each do |link|
	link.delete
end

puts "Deleting posts..."
Post.all.each do |post|
	post.delete
end

puts "Seeding links..."

file = File.new("#{Rails.root}/db/seed-data/link_seed.txt", "r")
while (line = file.gets)
	the_link = line.split(",")
	url = the_link[0]
	text = the_link[1]
	Link.create(:text => text, :url => url)
end
file.close

puts "Seeding posts..."

total_posts = Dir.new("#{Rails.root}/db/seed-data/posts").entries.delete_if{|name| name=="." || name==".."}.length
current_post = 1

total_posts.times do
	post_file = File.new("#{Rails.root}/db/seed-data/posts/#{current_post}.txt", "r")
	current_line=1
	body = ""
	while (line = post_file.gets)
		if current_line == 1
			title = line
		else
			body << line
		end
		current_line += 1
	end
	post = Post.create(:title => title, :body => body, :published => true)
	post_file.close
	
	puts "Seeding playlist for post #{current_post}"
	
	playlist_file = File.new("#{Rails.root}/db/seed-data/playlists/#{current_post}.xml", "r")
	xml_data = playlist_file.read
	playlist_file.close
	
	doc = REXML::Document.new(xml_data)
	
	current_playlist_num = 1
	
	doc.elements.each('ol/li') do |li|
		url = ""
		artist = ""
		
		li_text = li.get_text
		li_text = li_text.to_s.sub("&nbsp;"," ")
		li_array = li_text.split("-")
		title = li_array[1].strip.sub("&nbsp;","")
		
		if li.has_elements?
			a = li.elements['a']
			url = a.attributes['href'].to_s
			artist = a.get_text.to_s.strip.sub("&nbsp;","")
		else
			artist = li_array[0].strip.sub("&nbsp;","")
		end
		
		playlist = post.playlists.build(:url => url, :title => title, :artist => artist, :number => current_playlist_num)
		playlist.save
		
		current_playlist_num += 1
	end
	
	current_post += 1
end