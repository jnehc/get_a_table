class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

def self.search(search)
  if search
      where("LOWER(name) LIKE ? OR LOWER(category) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  else
    self.all
  end
end

end
