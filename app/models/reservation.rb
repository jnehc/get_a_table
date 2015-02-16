class Reservation < ActiveRecord::Base
belongs_to :restaurant
belongs_to :user

validates :party_size, :party_time, presence: true


end
