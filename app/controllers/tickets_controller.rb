class TicketsController < ApplicationController

  # Listagem de passagens: Se usuário estiver logado

  def index
    @tickets = Ticket.all
  end

  # Exibição de uma passagem específica

  def show
    @tickets = Ticket.find(params[:id])
  end

end
