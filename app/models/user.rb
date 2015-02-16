class User < ActiveRecord::Base
has_many :reservations
 has_secure_password

 validates :email, :name, presence: true
 validates :email, confirmation: true
 validates :email_confirmation, presence: true
end

# This check is performed only if email_confirmation is not nil. 
# To require confirmation, make sure to add a presence check for the 
# confirmation attribute