class Plant < ApplicationRecord
  belongs_to :user
  has_many :carings
  mount_uploader :photo, PhotoUploader
  validates :user, :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  include PgSearch
  pg_search_scope :search_by_title_and_syllabus,
    against: [ :title, :syllabus ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def owners
    carings.pluck(:user)
  end
end
