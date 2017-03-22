class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String, required: true
  property :date, DateTime

  belongs_to :user

end
