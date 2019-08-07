class Admin::ProfileController < ApplicationController
  def index
    @user = current_user

    if @user.student?
      @bookings = @user.bookings
      @messages = @user.messages
    else
      @professional = @user.professional
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

def user_params
  params.require(:user).permit(:first_name, :last_name, :birth, :user_description, :photo)
end

end
