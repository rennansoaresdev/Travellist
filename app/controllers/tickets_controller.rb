class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]
  # Listagem de passagens: Se usuário estiver logado
  def index
    @tickets = Ticket.where(trip_id: params[:trip_id])
  end

  def new
    @ticket = Ticket.new
    @trip = Trip.find(params[:trip_id])
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.trip_id = params[:trip_id]
    if @ticket.save
      redirect_to ticket_path(@ticket), notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
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
end
