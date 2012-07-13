class Type < ActiveRecord::Base
  attr_accessible :name

  has_many :scripts

  def to_s
    name
  end
end
