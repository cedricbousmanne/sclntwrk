attributes :id
node(:display_name){ |u|
  u.display_name
}
child(:photo => :photo){|u|
  node(:thumb_50){|p|
    p.thumb('50x50#').url
  }
}