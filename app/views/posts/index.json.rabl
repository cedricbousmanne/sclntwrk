collection @posts
attributes :id, :content, :created_at, :updated_at
node(:author_display_name){|p|
  p.author.display_name
}
child(:author => :author){
  extends('/users/show')
}
# node(:author_photo_thumb_50x50_url){ |p|
#   p.author.photo.thumb('50x50#').url
# }