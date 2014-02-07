object @asset
attributes :id, :file_uid
node(:thumb_url){ |a|
  a.file.thumb("100x100#").url
}