class Number < ActiveRecord::Base
  attr_accessible :number, :name, :script_id, :user_id, :verified
  belongs_to :script
  belongs_to :user

  def to_s
    name
  end
end
