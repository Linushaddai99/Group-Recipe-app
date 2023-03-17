class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /inventories or /inventories.json
  def index
    # @inventories = Inventory.all

    return unless current_user

    return unless current_user.present?

    # @inventories = Inventory.includes([:user]).where(user: current_user).order(created_at: :desc)
    @inventories = Inventory.where(user: current_user).all

    # @inventories = Inventory.includes(:user).find(params[:user_id])
    # @posts = Post.where(author_id: params[:user_id])
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    return unless current_user

    @foods = Food.all
    @meals = InventoryFood.where(inventory_id: params[:id])
    # @inventory_food = InventoryFood.where(inventory_id: params[:inventory_id], id: params[:id])
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit; end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    #  params.fetch(:inventory, {name})
    params.require(:inventory).permit(:name, :description).merge(user: current_user)
  end
end

# params.require(:inventory).permit(:name, :description).merge(user: current_user)
