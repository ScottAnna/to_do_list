class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :completed]
  before_action :logged_in?

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new(user_id: session[:user_id])
    @list.tasks.build(order_number: @list.next_order_number)
  end

  # GET /lists/1/edit
  def edit
    @list.tasks.build(order_number: @list.next_order_number)
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def completed
    if @list.update(list_params)
      render '/lists/update'
    else
      render :edit
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
      if @list.update(list_params)
        redirect_to @list, notice: 'List was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private def logged_in?
    unless User.find_by_id(session[:user_id])
      redirect_to sessions_login_path, notice: 'User or Password does not match our records.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :user_id, tasks_attributes: [:id, :name, :due, :order_number, :_destroy])
    end
end
