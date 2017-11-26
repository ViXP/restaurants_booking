class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if reservation.save
        format.html { redirect_to restaurant_path(reservation.dining_table.restaurant_id), 
          notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: reservation }
      else
        format.html { render :new }
        format.json { render json: reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserve_date, :reserve_start, :reserve_end, :reserver_name, :dining_table_id).
    merge({dining_table_id: params[:dining_table_id]})
  end
end
