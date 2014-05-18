require 'resque'

module DelayedDragonfly
  module Jobs
    class Resque
      @queue = :dragonfly

      def self.enqueue_upload(object, method_name)
        ::Resque.enqueue(self, object, method_name)
      end

      def self.perform(object, method_name)
        DelayedDragonfly.process_job(object, method_name)
      end
    end
  end
end