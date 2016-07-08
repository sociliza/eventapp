class User < ApplicationRecord
  after_create :build_stuff
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, format: { without: /^((http|https):\/\/)[a-z0-9]*(\.?[a-z0-9]+)\.[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix, multiline: true }

  has_one :profile, as: :profileable, dependent: :destroy

  has_one :place, as: :placeable
  accepts_nested_attributes_for :place, reject_if: :all_blank

  validates :name, presence: true

  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :subscriptions

  has_many :reverve_subscriptions, foreign_key: :leader_id, class_name: "Subscription", dependent: :destroy
  has_many :followers, through: :reverve_subscriptions

  has_many :sent_messages, class_name: "Conversation", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Conversation", foreign_key: "recipient_id"
  has_many :messages

  # invite invitations
  has_many :invites
  has_many :events_as_guest, through: :invites, source: :event


  def following?(leader)
    leaders.include? leader
  end

  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
    end
  end

  def unfollow!(leader)
    if leader != self && following?(leader)
      subscriptions.find_by(leader_id: leader.id).destroy
    end
  end

  def timeline_user_ids
    leader_ids + [id]
  end

  def build_stuff
    self.create_profile
    self.create_place
  end

  # Event Methods

  def upcoming_events
    self.events_as_guest.upcoming
  end

  def previous_events
    self.events_as_guest.past
  end

  def attending?(event)
    event.guests.include?(self)
  end

  def attend!(event)
    self.invites.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.invites.find_by(attended_event_id: event.id).destroy
  end
end
