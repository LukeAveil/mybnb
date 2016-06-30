require 'date'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Integer
  property :date, Date

  belongs_to :user
  belongs_to :space

  def self.date_valid(available_dates, requested_dated)
     return available_dates.map{|av_date| return av_date.date}.include?{requested_date}
  end

end
