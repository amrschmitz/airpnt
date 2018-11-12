class Plant < ApplicationRecord
  belongs_to :user
  has_many :carings

  validates :user, :name, presence: true
end
