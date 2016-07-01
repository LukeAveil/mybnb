require 'data_mapper'
require './lib/app.rb'
require 'date'
require './lib/models/available_date.rb'

namespace :db do

	desc "Non destructive upgrade"
	task :auto_upgrade do
		DataMapper.auto_upgrade!
		puts "Auto-upgrade complete (no data loss)"
	end

	desc "Destructive upgrade"
	task :auto_migrate do
		DataMapper.auto_migrate!
    (Date.today..(Date.today + 500)).each {|date| AvailableDate.create(date: date)}
		puts "Auto-migrate complete (data was lost)"
	end

	desc "Seed Database with Available Dates"
	task :seed_dates do
		(Date.today..(Date.today + 500)).each {|date| AvailableDate.create(date: date)}
		puts "Dates Added to available_dates tables"
	end

end
