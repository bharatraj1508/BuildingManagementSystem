class ProfilesController < ApplicationController

  before_action :set_user, except: [:index, :search]

  def index
    
    @search_categories = [["All Categories", "all"], "name", "email", "roles", "phone"]

    if params[:search]
      search_result
    else
      @pagy, @users = pagy(User.order(params[:sort]), items: 10)
    end

    if @users
      @search_category = params[:category] || "All Categories"
      authorize [:admin, @users]
    else
      redirect_to profiles_path, notice: "No Result Found"
    end
  end



  def show
    @details = params[:details] || "user_details"
  end


  def edit
  end



  def update
    if @user.update(user_params)
      if @user.email_previously_changed?
        resend_email_verification
        redirect_to home_path, notice: "Account Email changed and verificaiton email has been sent"
      else
        redirect_to profile_path(@user, details: "user_details"), notice: "Your profile has been updated successfully"
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

    authorize [:admin, @user]
    
    if @user.destroy
      redirect_to profiles_path, notice: "User has been deleted successfully"
    else
      render :index, alert: "Unable to delete the user"
    end
  end


  def search
    search_items = search_params()
    redirect_to profiles_path(search: search_items[:search_value], category: search_items[:search_category])
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :roles,
      :phone,
      :work,
      :emergency_person_one,
      :emergency_person_one_number,
      :emergency_person_two,
      :emergency_person_two_number,
      :vehicle_company,
      :vehicle_model,
      :vehicle_color,
      :vehicle_plate_number,
      building_ids: [],
      unit_ids: []
      )
  end

  def search_params
    params.permit( :search_value, :search_category )
  end

  def search_result
    
    value = params[:search]
    category = params[:category]

    case category
    when "name"
      @pagy, @users = pagy(User.search_by_name(value), items: 10)
    when "email"
      @pagy, @users = pagy(User.search_by_email(value), items: 10)
    when "roles"
      @pagy, @users = pagy(User.search_by_roles(value), items: 10)
    when "phone"
      @pagy, @users = pagy(User.search_by_phone(value), items: 10)
    when "all"
      @pagy, @users = pagy(User.search_all(value), items: 10)
    else
      @users = nil
    end
    
  end

  def resend_email_verification
    UserMailer.with(user: @user).email_verification.deliver_later
  end

end