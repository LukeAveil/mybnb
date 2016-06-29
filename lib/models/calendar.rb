require 'date'

class Calendar

  attr_reader :year, :month

  def initialize(dates)
    dates.push(Date.today) if dates.empty?
    @year = dates.last.year
    @month = dates.last.month
  end

  def list_dates
    days_in_month = Date.new(@year, @month, -1).day

    date_list = []

    (1..days_in_month).each do |day|
      date_list.push(Date.parse("#{@year}-#{format_date(@month)}-#{format_date(day)}"))
    end

    return date_list
  end

  private

  def format_date(number)
    number.to_s.length == 1 ? "0#{number}" : "#{number}"
  end
end
