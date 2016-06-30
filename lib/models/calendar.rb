require 'date'

class Calendar

  def self.days_for_next_year
  	date_list = []
  	(0...365).each{ |i| date_list << Date.today + i }
  	return date_list
  end

  def self.extract_dates(array)
    array.map { |d| d.date }
  end

  def self.invert_dates(array)
    date_list = self.days_for_next_year
    date_list - array
  end
end
