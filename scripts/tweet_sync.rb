require 'clockwork'
# Require the full rails environment if needed
require './config/boot'
require './config/environment'
include Clockwork

# Define the jobs
handler do |job|
  if job.eql?('twitter.sync_process')
    SyncData.process
  end
end

# Define the schedule
every(15.minutes, 'twitter.sync_process')
