class MembersController < ApplicationController
  before_action :set_trip, only: :create
  before_action :set_member, only: :destroy

  def create
    @member = Member.new(member_params)
    @task = Task.new
    @member.trip = @trip

    if @member.save
      redirect_to trip_path(@trip), notice: "Usuário adicionado"
    else
      render "trips/show", status: :unprocessable_entity, alert: 'Erro ao adicionar'
    end
  end

  def destroy
    @member.destroy
    redirect_to trip_path(@member.trip), status: :see_other
  end

  private

  def member_params
    params.require(:member).permit(:user_id)
  end

  def set_member
    @member = Member.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
