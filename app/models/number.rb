class Number < ActiveRecord::Base
  attr_accessible :number, :name, :script_id
  belongs_to :script
end