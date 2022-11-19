class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  before_action :set_user
  before_action :set_group

  # GET /entities or /entities.json
  def index
    @entities = @group.entities
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @entity = @user.entities.build
    @entity.group_ids = @group.id
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @entity = @user.entities.build(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_path(@entity.group_ids), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to group_url(@group), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
