class DoorLock < ApplicationRecord
  belongs_to :user
  has_many :clients, dependent: :destroy
  has_many :updates, dependent: :destroy
end
