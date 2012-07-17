class Song < ActiveRecord::Base
  attr_accessible :artist_id, :name

  belongs_to :artist
end
