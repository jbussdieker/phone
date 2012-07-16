class Call < ActiveRecord::Base
  attr_accessible :CallSid, :AccountSid, :Caller, :Called, :CallStatus, :CallDuration

  def recordings
    Message.where("CallSid = ?", self.CallSid)
  end
end
