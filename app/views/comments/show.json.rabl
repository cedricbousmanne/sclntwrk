attributes :id, :created_at, :updated_at
node(:content){|p|
  linkify_hashtags(p.content)
}
node(:author_display_name){|p|
  p.author.display_name
}
child(:author => :author){
  extends('/users/show')
}