class Update < ApplicationRecord
  belongs_to :door_lock
  enum key_type: [:card, :token, :virtual]
end
