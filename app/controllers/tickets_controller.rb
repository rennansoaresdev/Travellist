class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
    @ticket = Ticket.new
    @trip = Trip.find(params[:trip_id])
  end

  def show
    @ticket = Ticket.find(params[:id])
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
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def ticket_params
    params.require(:ticket).permit(:url, :start_time, :end_time, :origin, :destination, :seat, :gate, :price, :company_name)
  end
end
