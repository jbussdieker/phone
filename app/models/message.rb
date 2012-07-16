class Message < ActiveRecord::Base
  attr_accessible :url, :number, :new, :CallSid, :mailbox_id

  belongs_to :mailbox
end
