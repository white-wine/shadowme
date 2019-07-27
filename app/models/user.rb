class User < ApplicationRecord
  # mount_uploader :photo, PhotoUploader

  has_one :professional, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  enum user_type: {student: 0, professional: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def identifier
   if (first_name).nil?
     email
   else
     return "#{first_name.capitalize}"
   end
 end
end
