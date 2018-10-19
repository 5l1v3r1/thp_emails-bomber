require_relative 'lib/app/townhalls_scrapper'
require_relative 'lib/app/townhalls_mailer'
require_relative 'lib/app/townhalls_follower'

def perform
  Scrapp_All.new.perform
  Mailer.new.perform
  Follower.new.perform
end

perform
