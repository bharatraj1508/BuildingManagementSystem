class AccessManagement::AccessUnitsController < ApplicationController
  def new
  end

  def create
    user = User.find(params[:user_id])
    new_unit = Unit.find(params[:move_unit_id])
    
    if new_unit.users.where(id: user.id).present?
      redirect_to new_access_management_access_units_path, alert: "Error! This user alreadt exist"
    else
      new_unit.users << user
      redirect_to new_access_management_access_units_path, notice: "User moved to new Unit"
    end
  end

  def destroy
    old_unit = Unit.find(params[:unit_id])
    user = User.find(params[:user_id])
    old_unit.users.destroy(user)
    redirect_to new_access_management_access_units_path, notice: "User removed from unit"
  end

end
