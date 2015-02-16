class Reservation < ActiveRecord::Base
belongs_to :restaurant
belongs_to :user

validates :party_size, :date, :time, presence: true

validate :availability

#add reservations def to check availability
private
def availability
		if !restaurant.available?(party_size, date, time)
			errors.add(:base, "Restaurant is full for at this time")
		end
	end

end
