class AccommodationsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @accommodations = @trip.accommodations
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.user = current_user
    @accommodation.trip_id = params[:trip_id]
    if @accommodation.save
      redirect_to trip_accommodations_path(@trip), notice: 'Acomodação criada.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
    @trip = @accommodation.trip
  end

  def update
    @accommodation = Accommodation.find(params[:id])
    if @accommodation.update(accommodation_params)
      redirect_to trip_accommodations_path(@accommodation.trip), notice: 'Acomodação atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @accommodation = @trip.accommodations.find(params[:id])
    @accommodation.destroy
    redirect_to trip_accommodations_path(@trip), notice: "Acomodação excluída com sucesso."
  end

  private


  def accommodation_params
    params.require(:accommodation).permit(:url, :checkin_time, :checkout_time, :price, :capacity, :category, :name, :address, :photo )
  end
end
