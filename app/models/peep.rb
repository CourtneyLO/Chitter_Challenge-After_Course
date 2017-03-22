require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String, required: true
  property :date, DateTime

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
