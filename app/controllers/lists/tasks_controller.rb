class Lists::TasksController < TasksController
  before_action :set_list

private

  def set_list
    @list = List.find(params[:list_id])
  end
end

