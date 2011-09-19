xml.instruct!
xml.rss("version" => "2.0", "xmlns:content" => "http://purl.org/rss/1.0/modules/content/") do
  xml.channel do
    xml.title "Monumental Tracks"
    xml.link "http://www.monumentaltracks.com"
    xml.description "Podcast broadcasting ska, punk, and rock 'n' roll from the suburbs of Washington, DC"
    xml.language "en-us"

    for post in @posts
      xml.item do
        xml.pubDate Time.parse(post.published_at.to_s).rfc822
        xml.title post.title
        xml.link "http://www.monumentaltracks.com/posts/#{post.id}"
        xml.description do
          @playlist = ""
          
        	post.playlists.each do |item|
        		@playlist << "#{item.number}. #{item.artist} - #{item.title}\n"
        	end
        	
        	xml << @playlist
        end
        xml.content :encoded, xml.cdata!("#{strip_tags(post.body)}\n\n#{@playlist}")
        xml.enclosure("","url" => URI.escape(post.enclosure.url), "length" => post.enclosure.enclosure_file_size, "type" => post.enclosure.enclosure_content_type)
        xml.guid URI.escape(post.enclosure.url)
      end
    end
  end
end