module DelayedDragonfly
  module Jobs
    autoload :DelayedJob, 'delayed_dragonfly/jobs/delayed_job'
    autoload :Resque,     'delayed_dragonfly/jobs/resque'
    autoload :Sidekiq,    'delayed_dragonfly/jobs/sidekiq'
  end
end