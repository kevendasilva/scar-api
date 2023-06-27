class Client < ApplicationRecord
  belongs_to :door_lock
  enum key_type: [:card, :token, :virtual]
end
