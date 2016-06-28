require 'date'

class Calendar

  attr_reader :year, :month, :available_dates
  
  def initialize(year, month, available_dates)
    @year = year
    @month = month
    @available_dates = available_dates
  end 
  
  def list_dates
    days_in_month = Date.new(@year, @month, -1).day
    date_list = {}
    
    (1..days_in_month).each do |day|
      date = "#{@year}-#{format_date(@month)}-#{format_date(day)}"
      if @available_dates.include?(date)
        date_list[date] = true
      else 
        date_list[date] = false
      end 
    end
    return date_list
  end

  private

  def format_date(number)
    number.to_s.length == 1 ? "0#{number}" : "#{number}"
  end
end