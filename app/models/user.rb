class User < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  # after_create :send_welcome_email

  after_create :generate_validate_key

  has_one :professional, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages, dependent: :destroy
  enum user_type: {student: 0, professional: 1}
  enum account_status: {pending_validation: 0, confirmed_validation: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  include PgSearch::Model
  multisearchable against: [ :first_name, :last_name ]
  pg_search_scope :search_by_name_or_specialty,
  against: [ :first_name, :last_name ],
  associated_against: {
    professional: [ :specialty ]
  },
  using: {
    tsearch: { prefix: true }
  }

  def identifier
   if (first_name).nil?
     email
   else
     return "#{first_name.capitalize}"
   end
 end

 def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  def generate_validate_key
    user = User.last
    if user.photo.nil?
      user.photo = "https://refilmery.com/wp-content/uploads/2016/05/avatar-inside-a-circle.png"
    end
    if user.account_status.nil?
      user.account_status = 0
    end
    if user.first_name.nil?
      user.first_name = user.email.split("@")[0].capitalize
    end
    user.validation_key = Faker::Alphanumeric.alphanumeric 10
    user.save
  end

end
