class Mailbox < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :messages

  def new_messages
    messages.where("new = ?", true)
  end

  def saved_messages
    messages.where("new = ?", false)
  end
end
