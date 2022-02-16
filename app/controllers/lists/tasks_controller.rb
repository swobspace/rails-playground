class Lists::TasksController < TasksController
  before_action :set_taskable

private

  def set_taskable
    @taskable = List.find(params[:list_id])
  end
end

