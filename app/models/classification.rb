class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    all
  end
  # returns all classifications

  def self.longest
    Boat.longest.classifications
  end
  # returns the classifications for the longest boat 

end
