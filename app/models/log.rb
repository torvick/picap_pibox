class Log
  include Mongoid::Document
  include Mongoid::Timestamps
  field :response, type: Hash
  field :success, type: Boolean
  field :type_response, type: Integer
  field :code, type: Integer


end
