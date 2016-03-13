class ClientStore < ActiveRecord::Base
  belongs_to :client
  belongs_to :store
end
