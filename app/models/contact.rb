class Contact < ActiveRecord::Base
  attr_accessible :name, :number, :user_id

  belongs_to :user
end
