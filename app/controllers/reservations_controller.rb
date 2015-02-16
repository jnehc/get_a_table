class ReservationsController < ApplicationController
 def show
  @reservation = Reservation.find(params[:id])
end

	def new
    @reservation = Reservation.new
  end

  def create
  	
  	end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    
    end
  end


	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurant_path, notice: "Your reservation was cancelled."

	end

 private
  def reservation_params
  	params.require(:reservation).permit(:party_size, :date, :time)
  end


end