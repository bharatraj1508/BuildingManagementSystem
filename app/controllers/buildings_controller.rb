class BuildingsController < ApplicationController

    before_action :set_building, except: [:new, :create, :index]

    def new
        @building = Building.new
        set_manager_supervisor
    end


    def create
        @building = Building.new(building_params)

        if @building.save
            redirect_to buildings_path, notice: "Building has been created successfully"
        else
            render :new, status: :unprocessable_entity
        end
    end



    def update
        if @building.update(building_params)
            redirect_to buildings_path, notice: "Building information has been changed successfully"
        else
            render :edit, notice: "Building information has been changed successfully"
        end
    end


    def index
        @buildings = Building.all
    end

    def edit
        set_manager_supervisor
    end

    def destroy
        authorize [:admin, Current.user]

        if @building.destroy
            redirect_to buildings_path, notice: "Building has been deleted successfully"
          else
            render :index, alert: "Unable to delete the building"
          end
    end

    private

    def set_manager_supervisor
        @managers = User.search_by_roles("manager")
        @supervisors = User.search_by_roles("supervisor")
        @manager_list = [["Select a manager for the building", ""]]
        @supervisor_list = [["Select a supervisor for the building", ""]]

        @managers.each do |manager|
            @manager_list.push(["#{manager.name}, #{manager.email}", manager.id])    
        end

        @supervisors.each do |supervisor|
            @supervisor_list.push(["#{supervisor.name}, #{supervisor.email}", supervisor.id])    
        end
    end

    def set_building
        @building = Building.find(params[:id])
    end
    def building_params
        params.require(:building).permit( :name, :address, :building_manager, :building_supervisor )
    end

    
end
