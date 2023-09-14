class TasksController < ApplicationController
  before_action :set_trip, only: :create
  before_action :set_task, only: %i[update destroy]

  def create
    @task = Task.new(task_params)
    @task.trip = @trip
    if @task.save
      redirect_to trip_path(@trip), notice: "Tarefa adicionada a #{@trip.name}"
    else
      @member = Member.new
      render "trips/show", status: :unprocessable_entity
    end
  end

  def update
    @task.update(task_params)
    if @task.save
      respond_to(&:js)
      # redirect_to trip_path(@trip)
    else
      render 'trips/index', status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to trip_path(@task.trip), status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:description, :done)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
end
