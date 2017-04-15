require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Connex
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
      #Keen IO setup
      Keen.project_id = "58e72ab495cfc9addc24703b"
      Keen.write_key = "0292B50C5B7390483C972C8CBD1ED7627D2BB9372967B6466D717C97ABCDDDC4C0F741630F36DFD05DA1E68022C935E2DBA00B70F0A72EE75555A98E75BEFC87301392A77CF97AF15FDE1D67A7CD087CA6105B6C2DFE5683624B13885CE56B56"
    
      Keen.publish(:signups, {
        :username => "lloyd",
        :referred_by => "harry"
      })
      
      #Informant Setup 
      INFORMANT_API_KEY = ddd3832f1fa987922cb90bd263398d56
    
  end
end
