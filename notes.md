# Design
* Clean
* [x] Use Twitter bootstrap fluid layout with sidebar
* [] Display links on left side bar
* [] Display links to admin actions on left side bar

# Admin Interface
* [] Create a way to secure the below
* [] Update blog/podcast config
* [x] Create new post
* [x] Edit existing post
* [x] Delete post
	* [] Deletes enclosures and playlists
		* [] Enclosures should be removed from disk as well
		
# Create Post
* [x] Title
* [x] Body
	* [] WYSIWYG HTML Editor
* [x] Add playlist
* [x] Upload audio

# RSS
* [x] Generated with only published posts
* [] Possible iTunes support later but, Feedburner does this much better
	
# Automatic conversion of audio files
* [] Use Paperclip::Processor
* [] Likely will run a ffmpeg command line
	* [] Requires installing and configuring ffmpeg 
	* [] Cocaine for command line interface
* [] Should run in background
	* [] https://github.com/collectiveidea/delayed_job
* [] Configurable format
	* [] Admin config once?
	* [] Ask user to select formats at upload?

# Models
## Posts
* title:string
* body:text
* published:boolean
### Notes
* has_many playlists
* has_many enclosures

## Playlist 
* post_id:integer
* number:integer
* artist:string
* title:string
* url:string
### Notes
* belongs_to post

## Enclosure
* post_id:integer
* enclosure_file_name:string
* enclosure_content_type:string
* enclosure_file_size:integer
* enclosure_updated_at:datetime
### Notes
* belongs_to post
* has_attached_file :enclosure
	*via Paperclip

## Setting
* key:string
* value:string
### Notes
* Stores config information for the blog and podcast
	* eg. title, description, header image, etc.
	
## Link
* text:string
* url:string
### Notes
* Used to display links in a sidebar on the main page