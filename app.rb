require_relative 'lib/app/townhalls_scrapper'
require_relative 'lib/app/townhalls_mailer'
require_relative 'lib/app/townhalls_follower'

Scrapp_All.new.perform
Mailer.new.perform
#Follower.new.search_all_handle
