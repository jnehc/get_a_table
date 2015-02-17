class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

    validates_presence_of :title


  #addrestaurant def to check when available?
  def available?(party_size, date, time)
		total_reservation_count = reservations.where(date: date, time: time).sum(:party_size)
		party_size + total_reservation_count <= 100 #capacity
	end


   def self.find_by_first_letter(letter)
    find(:all, :conditions => ['title LIKE ?', "#{letter}%"], :order => 'title ASC')
  end
  
#from railcasts.com
def self.search(search)
  if search
      where("LOWER(name) LIKE ? OR LOWER(category) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  else
    self.all
  end
end

end
