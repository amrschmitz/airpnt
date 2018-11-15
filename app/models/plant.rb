class Plant < ApplicationRecord
  belongs_to :user
  has_many :carings
  mount_uploader :photo, PhotoUploader

  validates :user, :name, presence: true

  def owners
    carings.pluck(:user)
  end
end
