class DoorLock < ApplicationRecord
  belongs_to :user
  has_many :clients, dependent: :destroy
end
