require 'data_mapper'
require 'dm-postgres-adapter'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String, length: 500
  property :price, String

end
