class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to edit_profile_path, notice: "Votre profil a été mis à jour"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :photo)
  end

end
