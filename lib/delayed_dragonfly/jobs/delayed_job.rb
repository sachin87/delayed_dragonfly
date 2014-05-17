require 'delayed_job'

module DelayedDragonfly
  module Jobs
    class DelayedJob < Struct.new(:instance_klass, :instance_id, :upload_name)

        def self.enqueue_delayed_paperclip(instance_klass, instance_id, upload_name)
          ::Delayed::Job.enqueue(
            new(instance_klass, instance_id, upload_name),
            instance_klass.constantize.paperclip_definitions[upload_name][:delayed][:priority].to_i,
            instance_klass.constantize.paperclip_definitions[upload_name][:delayed][:queue]
          )
        end

      def perform
        DelayedDragonfly.process_job(instance_klass, instance_id, upload_name)
      end
    end
  end
end