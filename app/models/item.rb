class Item < ActiveRecord::Base
  attr_accessible :value, :type_id

  belongs_to :script
  belongs_to :type
end
