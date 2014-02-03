collection @posts
attributes :id, :content, :created_at, :updated_at
node(:author_display_name){|p|
  p.author.display_name
}
child(:author => :author){
  extends('/users/show')
}