class BookingsController < ApplicationController
    #before calling the below actions you must first call the set booking method#
    before_action :set_booking, only: [:show, :edit, :update, :destroy]
    
    
    def index
      @bookings = Booking.all
    end
    
     def show
        @booking = Booking.find(params[:id])
     end
    
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
    
    def edit
        #@booking = Booking.find(params[:id])
    end
    
    def update
        @booking = Booking.find(params[:id])
        
        if @booking.update(booking_params)
            flash[:notice] = "Booking Updated!"
            redirect_to @booking
        else 
          flash.now[:alert] = "Booking not Updated"
          render "edit"
        end
    end
    
    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
    end
        
    
    private
    
      def set_booking
        @booking = Booking.find(params[:id])
        
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The page you just requested does not exist"
        redirect_to bookings_path
      end
          
          
    def booking_params
        params.require(:booking).permit(:idnumber, :firstname, :lastname, :phone, :booking_for, :clubname, :location)
    end
end