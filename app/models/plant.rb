class Plant < ApplicationRecord
  belongs_to :user
  has_many :carings
  mount_uploader :photo, PhotoUploader
  validates :user, :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def owners
    carings.pluck(:user)
  end
end
