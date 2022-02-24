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
    if @taskable.present?
      @task = @taskable.tasks.build
    else
      @task = Task.new
    end
    respond_with(@task)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    if @taskable.present?
      @task = @taskable.tasks.build(task_params)
    else
      @task = Task.new(task_params)
    end

    respond_with(@task, location: location) do |format|
      if @task.save
        format.turbo_stream
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
   respond_with(@task, location: location) do |format|
      if @task.update(task_params)
        format.turbo_stream
      end
    end
  end

  # DELETE /tasks/1
  def destroy
   respond_with(@task, location: location) do |format|
      if @task.destroy
        format.turbo_stream
      end
    end
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

    def location
      if action_name == 'destroy'
        polymorphic_path(@taskable || :tasks)
      else
        polymorphic_path(@taskable || @task)
      end
    end

end
