class Tut < ApplicationRecord
end


class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (sender_id, recipient_id) do
  	where("(conversations.sender_id = ? AND conversations.recipient_id = ?) 
  		OR (conversations.sender_id = ? AND conversations.recipient_id = ?)",
  		sender_id, recipient_id, recipient_id, sender_id)
  end 
end

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  def message_time
  	created_at.strftime("%m/%d/%y at %I:%M %p")
  end
end
