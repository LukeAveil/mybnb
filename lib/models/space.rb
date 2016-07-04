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
    self.available_dates = self.available_dates.select do |available|
      available.date != date
    end

    self.save
  end

  def in_range?(from, to)
    available_dates.any? do |available|
      (available.date >= from && available.date <= to)
    end
  end

  def self.upload_photo(filename, file_contents)
    File.open('./lib/public/image_uploads/' + filename, "w") do |f|
      f.write(file_contents.read)
    end

    path = "./lib/public/image_uploads/"

    self.image_resize(path: path,
                 prefix: "small_",
                 filename: filename,
                 size: "200x200")

    self.image_resize(path: path,
                 filename: filename,
                 size: "500x500")

    self.image_resize(path: path,
                 prefix: "stripe_",
                 filename: filename,
                 size: "128x128")
  end

  private

  def self.image_resize(params)
    prefix = params.fetch(:prefix, "")
    image = MiniMagick::Image.open(params[:path] + params[:filename])
    image.resize(params[:size])
    image.write(params[:path] + prefix + params[:filename])
  end

end
