require 'date'

class Calendar


  def self.days_for_next_year
  	date_list = []
  	(0...365).each{ |i| date_list << Date.today + i }
  	return date_list
  end


end
