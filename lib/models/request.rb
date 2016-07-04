require 'date'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Integer
  property :date, Date
  property :payment_received, Boolean, default: false

  belongs_to :user
  belongs_to :space
  has n, :messages

  def confirm
    self.update(confirmed: 2)
  end

  def self.valid_date?(available_dates, requested_date)
    available_dates.map { |available| available.date }.include?(requested_date)
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
    requests = Request.all(space: space, date: Date.parse(date), confirmed: 2)
    return requests.empty?
  end

end
