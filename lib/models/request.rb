require 'date'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Integer
  property :date, Date

  belongs_to :user
  belongs_to :space

end
