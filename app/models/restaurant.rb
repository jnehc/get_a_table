class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  def available?(party_size, date, time)
		total_reservation_count = reservations.where(date: date, time: time).sum(:party_size)
		party_size + total_reservation_count <= 100 #capacity
	end

def self.search(search)
  if search
      where("LOWER(name) LIKE ? OR LOWER(category) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  else
    self.all
  end
end

end
