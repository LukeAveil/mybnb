require 'date'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Integer
  property :date, Date

  belongs_to :user
  belongs_to :space

  def self.date_valid(available_dates, requested_date)
     available_dates.map{|av_date| av_date.date}.include?(requested_date)
  end

  def self.date_not_already_booked(space, date)
    return Request.all(space: space, date: Date.parse(date), confirmed: 2).empty?
  end
end
