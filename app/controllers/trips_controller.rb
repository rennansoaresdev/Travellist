class TripsController < ApplicationController

  # Listagem de viagens: Se usuário estiver logado

  def index
    @trips = Trip.all
  end

  # Exibição de uma viagem específica

  def show
    @trips = Trip.find(params[:id])
  end
  
end
