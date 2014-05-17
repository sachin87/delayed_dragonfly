#base namespace
module DelayedDragonfly

  def background_processor
    if defined? ::Delayed::Job
      DelayedDragonfly::Jobs::DelayedJob
    elsif defined? ::Resque
      DelayedDragonfly::Jobs::Resque
    elsif defined? ::Sidekiq
      DelayedDragonfly::Jobs::Sidekiq
    end
  end

end
