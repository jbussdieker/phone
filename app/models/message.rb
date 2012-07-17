class Message < ActiveRecord::Base
  attr_accessible :url, :number, :new, :CallSid, :mailbox_id
  default_scope :order => 'new DESC, created_at DESC'
  belongs_to :mailbox
end
