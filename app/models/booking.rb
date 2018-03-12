class Booking < ActiveRecord::Base
    validates :idnumber, presence: true, length: {minimum: 6}
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :booking_for, presence: true
    validates :clubname, presence: true
    validates :location, presence: true
    
end
