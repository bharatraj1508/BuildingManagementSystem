class InvitationsController < ApplicationController
  def new
    @user = User.new
    authorize [:admin, @user]
  end

  def create
    
    # @user = User.create_with(user_params).find_or_initialize_by(email: params[:email])
    @user = User.new(user_params)
    authorize [:admin, @user]

    if params[:building_ids] == nil
      @user.buildings = Current.user.buildings
    end

    if @user.save
        send_invitation_instructions
        redirect_to new_invitation_path, notice: "An invitation email has been sent to #{@user.email}"
    else
        render :new, status: :unprocessable_entity
    end

  end

  def units
    @target = params[:target]
    building = Building.find(params[:bid])
    @units = building.units.pluck(:unit_number, :id)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def user_params
      params.permit(
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
        :vehicle_plate_number, building_ids: [], unit_ids: []
        ).merge(password: SecureRandom.base58, verified: true)
    end

    def send_invitation_instructions
      UserMailer.with(user: @user).invitation_instructions.deliver_later
    end
end
