# Models
## Posts
* post_id:integer
* title:string
* body:text
* published:boolean

## Playlist 
* post_id:integer
* number:integer
* artist:string
* title:string
* url:string

## Enclosure
* post_id:integer
* enclosure_file_name:string
* enclosure_content_type:string
* enclosure_file_size:integer
* enclosure_updated_at:datetime

## Config
* key:string
* value:string