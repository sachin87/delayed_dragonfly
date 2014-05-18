require 'dragonfly'
require 'delayed_dragonfly'

module DelayedDragonfly
  if defined? Rails::Railtie
    require 'rails'

    # On initialzation, include DelayedDragonfly
    class Railtie < Rails::Railtie
      initializer 'delayed_dragonfly.insert_into_active_record' do
        ActiveSupport.on_load :active_record do
          DelayedDragonfly::Railtie.insert
        end
      end
    end
  end

  class Railtie

    # Glue includes DelayedDragonfly Class Methods and Instance Methods into ActiveRecord
    # Attachment and URL Generator extends Dragonfly
    def self.insert
      ActiveRecord::Base.send(:include, DelayedDragonfly::Glue)
      Dragonfly::Model::Attachment.send(:include, DelayedDragonfly::Attachment)
    end
  end
end
