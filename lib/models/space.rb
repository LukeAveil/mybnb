require 'data_mapper'
require 'dm-postgres-adapter'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String, length: 500
  property :price, String

  belongs_to :user

  has n, :available_dates, through: Resource

  def confirm_booking_on(date)
    self.available_dates = self.available_dates.select do |av_date|
      av_date.date != date
    end

    self.save
  end

  def in_range?(from, to)
    available_dates.any? { |dateObj| (dateObj.date >= from && dateObj.date <= to) }
  end

end
