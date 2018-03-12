class BookingsController < ApplicationController
    def new
        @booking = Booking.new
    end
    
    def create
      @booking = Booking.new(booking_params)
      
        if @booking.save
            flash[:notice] = "Booking created"
            redirect_to @booking
        else
           
            flash.now[:alert] = "Booking not created"
            render "new"
    
        end
    end
    
    def show
        @booking = Booking.find(params[:id])
    end
    
    def index
      @bookings = Booking.all
    end
        
    
    private
    def booking_params
        params.require(:booking).permit(:idnumber, :firstname, :lastname, :phone, :booking_for, :clubname, :location)
    end
end