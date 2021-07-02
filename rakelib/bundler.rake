# frozen_string_literal: true

namespace :bundler do
  require 'bundler/audit/cli'

  desc 'Updates the ruby-advisory-db and ' \
       'checks the Gemfile.lock for insecure dependencies'
  task audit: %i[audit:update audit:check]

  namespace :audit do
    desc 'Updates the ruby-advisory-db'
    task :update do
      Bundler::Audit::CLI.start ['update']
    end

    desc 'Checks the Gemfile.lock for insecure dependencies'
    task :check do
      Bundler::Audit::CLI.start ['check']
    end
  end
rescue LoadError
  nil
end
