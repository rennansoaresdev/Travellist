class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]
  before_action :set_trip, only: %i[index new create]

  # Listagem de passagens: Se usuário estiver logado
  def index
    @tickets = Ticket.where(trip: @trip)
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.trip = @trip
    @ticket.user = current_user

    if @ticket.save
      redirect_to ticket_path(@ticket), notice: 'Passagem adicionada!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket), notice: 'Passagem atualizada'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
    redirect_to trip_path(@ticket.trip), status: :see_other
  end

  private

  def ticket_params
    params.require(:ticket).permit(:url, :start_time, :end_time, :origin, :destination, :seat, :gate, :price, :company_name)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
