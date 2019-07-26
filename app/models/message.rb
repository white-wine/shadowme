class Message < ApplicationRecord
  belongs_to :booking
  validates :content, presence: true
  belongs_to :sender, class_name: "User"
  after_create :notify_pusher, on: :create

  def notify_pusher
    Pusher.trigger('message', 'new', self.as_json)
  end
end
