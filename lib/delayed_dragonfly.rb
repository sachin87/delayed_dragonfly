require 'delayed_dragonfly/jobs'
require 'delayed_dragonfly/attachment'
require 'delayed_dragonfly/railtie'

#base namespace
module DelayedDragonfly

    def self.background_processor
      if defined? ::Delayed::Job
        DelayedDragonfly::Jobs::DelayedJob
      elsif defined? ::Resque
        DelayedDragonfly::Jobs::Resque
      elsif defined? ::Sidekiq
        DelayedDragonfly::Jobs::Sidekiq
      end
    end

end

module Dragonfly
  module Model
    module InstanceMethods

      private

      def save_dragonfly_attachments
        dragonfly_attachments.each do |attribute, attachment|
          DelayedDragonfly.background_processor.enqueue_upload(attachment, :save!)
        end
      end

    end
  end
end
