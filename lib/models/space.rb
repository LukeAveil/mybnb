require 'data_mapper'
require 'dm-postgres-adapter'
require 'mini_magick'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String, length: 500
  property :price, String
  property :photo, String

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

  def self.upload_photo(filename, file_contents)
    File.open('./lib/public/image_uploads/' + filename, "w") do |f|
      f.write(file_contents.read)
    end

    image = MiniMagick::Image.open("./lib/public/image_uploads/#{filename}")
    image.resize "200x200"
    image.write "./lib/public/image_uploads/small_#{filename}"

    image = MiniMagick::Image.open("./lib/public/image_uploads/#{filename}")
    image.resize "500x500"
    image.write "./lib/public/image_uploads/#{filename}"

  end

end
