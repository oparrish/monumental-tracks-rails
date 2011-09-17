xml.instruct!
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title @feed_title
    xml.link @feed_url
    xml.description @feed_description
    xml.language "en-us"

    for post in @posts
      xml.item do
        xml.pubDate Time.parse(post.updated_at.to_s).rfc822
        xml.title post.title
        xml.description do
        	post.playlists.each do |item|
        		xml << "#{item.number}. #{item.artist} - #{item.title}\n"
        	end
        end
        xml.enclosure("","url" => URI.escape(post.enclosure.url), "length" => post.enclosure.enclosure_file_size, "type" => post.enclosure.enclosure_content_type)
      end
    end
  end
end