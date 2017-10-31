#!/usr/bin/env ruby

require 'pry'

Dir[File.dirname(__FILE__) + '/prepare/*.rb'].each { |file| require file }

include Installer
include Functions
include Post

@app_list.map do |app|
  Installer.run(@app_list, app)
end

# END APP
puts
puts 'THE END'
