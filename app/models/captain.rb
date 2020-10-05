class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end
  # returns all captains of catamarans

  def self.sailors
    includes(boats: :classifications).where(classifications: {name: "Sailboat"}).distinct
  end
  # returns captains with sailboats

  def self.motorboat_operators
    includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  end

  def self.talented_seafarers
    where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
  end
  # returns captains of motorboats and sailboats 

  def self.non_sailors
    where.not("id IN (?)", self.sailors.pluck(:id))
  end
  #returns people who are not captains of sailboats

end
