class Message < ActiveRecord::Base
  attr_accessible :url, :number, :new, :CallSid

  belongs_to :mailbox
end
