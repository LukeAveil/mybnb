require 'date'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Integer
  property :date, Date

  belongs_to :user
  belongs_to :space

  def confirm
    self.update(confirmed: 2)
  end

  def self.date_valid(available_dates, requested_date)
     available_dates.map{|av_date| av_date.date}.include?(requested_date)
  end

  def self.unconfirmed_requests_for?(space)
    self.all.select do |req|
      req.confirmed == (1 || 2) && self.space == space
    end
  end

  def self.reject_requests(params)
    denied_requests = all(params)
    denied_requests.update(confirmed: 1)
  end

  def self.owner(user)
    requests_received = all.select do |request|
      request.space.user == user
    end
  end

  def self.date_not_already_booked(space, date)
    return Request.all(space: space, date: Date.parse(date), confirmed: 2).empty?
  end
end
