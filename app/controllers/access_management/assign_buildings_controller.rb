class AccessManagement::AssignBuildingsController < ApplicationController
  def new
  end

  def create
    if params[:building_id].present?
      user = User.find(params[:user_id])
      building = Building.find(params[:building_id])

      if building.users.where(id: user.id).present?
        redirect_to new_access_management_assign_buildings_path, alert: "Error! This user alreadt exist"
      else
        building.users << user
        redirect_to new_access_management_assign_buildings_path, notice: "User assigned to building"
      end
    else
      redirect_to new_access_management_assign_buildings_path, alert: "Error! You have to select building to assign"
    end
  end

end
