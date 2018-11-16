class User < ApplicationRecord
  # Dependencies
  has_many :plants, dependant: :destroy
  has_many :carings, dependant: :destroy
  has_many :requested_carings, through: :plants, source: :carings, dependant: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader

end
