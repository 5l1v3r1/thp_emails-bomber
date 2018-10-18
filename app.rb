require 'dotenv'
Dotenv.load
require_relative 'lib/app/townhalls_follower'
require_relative 'lib/app/townhalls_convert_to_hash'

Converter.new.perform