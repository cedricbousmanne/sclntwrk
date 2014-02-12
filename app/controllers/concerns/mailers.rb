module Concerns
  module Mailers

    private

    def default_url_options(options = {})
     {
       host: default_host,
       port: request.port
     }.merge(options)
    end

    def default_host
      if defined?(current_community)
        current_community.domain
      else
        CONFIG[:host]
      end
    end

    def set_mailer_config
      ActionMailer::Base.default_url_options = {:host => default_host}
    end
  end
end
