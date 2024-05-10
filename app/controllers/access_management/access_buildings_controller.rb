class AccessManagement::AccessBuildingsController < ApplicationController
  def new
  end

  def create
    if params[:new_building_id].present?
      user = User.find(params[:user_id])
      new_building = Building.find(params[:new_building_id])

      if new_building.users.where(id: user.id).present?
        redirect_to new_access_management_access_buildings_path, alert: "Error! This user alreadt exist"
      else
        new_building.users << user
        redirect_to new_access_management_access_buildings_path, notice: "User moved to new building"
      end
    else
      redirect_to new_access_management_access_buildings_path, alert: "Error! You have to select new building to move"
    end
  end

  def destroy
    if params[:building_id].present?
      user = User.find(params[:user_id])
      building = Building.find(params[:building_id])
      building.users.destroy(user)
      redirect_to new_access_management_access_buildings_path, notice: "User successfully removed from the building"
    else
      redirect_to new_access_management_access_buildings_path, alert: "You have not selected any building"
    end
  end
end
