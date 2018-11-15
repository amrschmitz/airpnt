class Plant < ApplicationRecord
  belongs_to :user
  has_many :carings
  mount_uploader :photo, PhotoUploader
  validates :user, :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  def owners
    carings.pluck(:user)
  end
end
