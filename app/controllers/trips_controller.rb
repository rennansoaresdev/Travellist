class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    # Necessário adicionar viagens criadas por OUTRAS pessoas, mas que o current_user pertença ao grupo
    @trips = Trip.where(owner: current_user)
  end

  def show
    @task = Task.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.owner = current_user
    if @trip.save
      redirect_to trip_path(@trip), notice: 'Criada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip), notice: 'As informações foram salvas'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, notice: "A viagem #{@trip.name} excluída"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date, :budget_per_user)
  end
end
