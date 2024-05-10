class AccessManagement::AssignUnitsController < ApplicationController
  def new
    @residents = User.where(roles: "resident")
  end

  def create
    if params[:user_id].present?
      user = User.find(params[:user_id])
      unit = Unit.find(params[:unit_id])
      unit.users << user
      redirect_to new_access_management_assign_units_path, notice: "User assigned to unit"
    else
      redirect_to new_access_management_assign_units_path, alert: "Error! You have to select user to assign"
    end
  end
end
