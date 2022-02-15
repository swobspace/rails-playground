class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all
    respond_with(@lists)
  end

  # GET /lists/1
  def show
    respond_with(@list)
  end

  # GET /lists/new
  def new
    @list = List.new
    respond_with(@list)
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    @list.save
    respond_with(@list)
  end

  # PATCH/PUT /lists/1
  def update
    @list.update(list_params)
    respond_with(@list)
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    respond_with(@list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:name)
    end
end
