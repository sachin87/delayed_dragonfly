$:.push File.expand_path("../lib", __FILE__)
require 'delayed_dragonfly/version'

Gem::Specification.new do |s|
  s.name        = 'delayed_dragonfly'
  s.version     = DelayedPaperclip::VERSION

  s.authors     = ['Sachin87']
  s.summary     = 'Asynchronously save Dragonfly attachments.'
  s.description = 'Asynchronously save Dragonfly attachments with DelayedJob, Resque, Sidekiq or your own processor.'
  s.email       = ['sachin.y87@gmail.com']
  s.homepage    = 'https://github.com/sachin87/delayed_dragonfly'

  s.add_dependency 'paperclip', [">= 3.3"]

  s.add_development_dependency 'mocha'
  s.add_development_dependency "rspec"
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'delayed_job'
  s.add_development_dependency 'delayed_job_active_record'
  s.add_development_dependency 'resque'
  s.add_development_dependency 'sidekiq', '< 3.0'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'railties'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
end

