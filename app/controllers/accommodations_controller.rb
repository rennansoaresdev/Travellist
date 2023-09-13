class AccommodationsController < ApplicationController
  before_action :set_accomodation, only: %i[show edit update destroy]
  before_action :set_trip, only: %i[index new create]

  def index
    @accommodations = @trip.accommodations
  end

  def show
  end

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.user = current_user
    @accommodation.trip = @trip
    if @accommodation.save
      redirect_to trip_accommodations_path(@trip), notice: 'Acomodação criada.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to trip_accommodations_path(@accommodation.trip), notice: 'Acomodação atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @accommodation.destroy
    redirect_to trip_accommodations_path(@accommodation.trip), notice: "Acomodação excluída com sucesso."
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:url, :checkin_time, :checkout_time, :price, :capacity, :category, :name, :address, :photo)
  end

  def set_accomodation
    @accommodation = Accommodation.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
