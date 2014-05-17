require 'sidekiq/worker'

module DelayedDragonfly
  module Jobs
    class Sidekiq
      include ::Sidekiq::Worker
      sidekiq_options queue: :dragonfly

      def self.enqueue_upload(instance_klass, instance_id, upload_name)
        perform_async(instance_klass, instance_id, upload_name)
      end

      def perform(instance_klass, instance_id, upload_name)
        DelayedDragonfly.process_job(instance_klass, instance_id, upload_name)
      end
    end
  end
end
