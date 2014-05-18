require 'sidekiq/worker'

module DelayedDragonfly
  module Jobs
    class Sidekiq
      include ::Sidekiq::Worker
      sidekiq_options queue: :dragonfly

      def self.enqueue_upload(object, method_name)
        perform_async(object, method_name)
      end

      def perform(instance_klass, instance_id, upload_name)
        DelayedDragonfly.process_job(object, method_name)
      end
    end
  end
end
