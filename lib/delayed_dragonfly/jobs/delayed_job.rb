require 'delayed_job'

module DelayedDragonfly
  module Jobs
    class DelayedJob < Struct.new(:object, :method_name)

        def self.enqueue_upload(object, method_name)
          ::Delayed::Job.enqueue(object, method_name)
        end

      def perform
        DelayedDragonfly.process_job(object, method_name)
      end
    end
  end
end