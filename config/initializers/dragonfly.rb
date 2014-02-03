require 'dragonfly'
require 'dragonfly/s3_data_store'


# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "zt+;xZ3v*w243PH+b>#Z*iD3VMA3U37ebb8f1efb79d56efab5ba68050607b93172b2d"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name:       CONFIG[:aws][:bucket],
    access_key_id:     CONFIG[:aws][:access_key_id],
    secret_access_key: CONFIG[:aws][:secret_access_key],
    storage_headers:   { 'Cache-Control' => 'max-age=315576000' }
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end