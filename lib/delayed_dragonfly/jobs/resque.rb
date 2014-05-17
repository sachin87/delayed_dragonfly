require 'resque'

module DelayedDragonfly
  module Jobs
    class Resque
      @queue = :dragonfly

      def self.enqueue_upload(instance_klass, instance_id, upload_name)
        ::Resque.enqueue(self, instance_klass, instance_id, upload_name)
      end

      def self.perform(instance_klass, instance_id, upload_name)
        DelayedDragonfly.process_job(instance_klass, instance_id, upload_name)
      end
    end
  end
end