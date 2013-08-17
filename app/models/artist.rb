class Artist < ActiveRecord::Base
  attr_accessible :band, :bio, :genre, :name
end
