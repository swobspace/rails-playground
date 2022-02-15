class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  # GET /tasks/1
  def show
    respond_with(@task)
  end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_with(@task)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    @task.save
    respond_with(@task)
  end

  # PATCH/PUT /tasks/1
  def update
    @task.update(task_params)
    respond_with(@task)
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:subject, :position, :list_id)
    end
end
