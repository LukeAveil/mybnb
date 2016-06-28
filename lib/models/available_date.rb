class AvailableDate

  include DataMapper::Resource

  has n, :spaces, through: Resource

  property :id, Serial
  property :date, Date

end
