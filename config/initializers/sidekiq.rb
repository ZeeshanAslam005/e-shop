# frozen_string_literal: true

schedule_file = 'config/schedule.yml' #grabe scheduler file
Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server? #load schedule.yml if exist
