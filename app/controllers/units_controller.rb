class UnitsController < ApplicationController

  def new
    @unit = Unit.new
  end

  def index

    if Current.user.buildings.count == 1
      @selected_building = Current.user.buildings.first
    end

    if params[:bid]
      @selected_building = Building.find(params[:bid])
    end

  end

  def search_unit
    redirect_to units_path(bid: params[:building])
  end


  def show
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to new_unit_path, notice: "Unit has been created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_unit
  end

  def update
    set_unit
    if @unit.update(unit_params)
      redirect_to units_path, notice: "Unit has been updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end


  private 

  def unit_params
    params.require(:unit).permit( :building_id, :unit_number, :parking_spot, :locker_number )
  end

  def set_unit
    @unit = Unit.find(params[:id])
  end
end
