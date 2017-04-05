class SessionsController < ApplicationController
  before_action :authenticate, only: [:destroy]

  # GET /login
  def new
    return @user = User.new unless logged_in?
    respond_to do |format|
      format.html { redirect_to account_path }
    end
  end

  # POST /login
  def create
    @user = User.find_by_username(user_params[:username])

    respond_to do |format|
      if @user
        if @user.authenticate(user_params[:password])
          log_in(@user)
          remember(@user)
          format.html { redirect_to account_path }
        else
          @user.errors.add(:password, 'is incorrect')
        end
      else
        @user = User.new
        @user.errors.add(:email, 'does not exist')
      end
      format.html { render :new }
    end
  end

  # DELETE /logout
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
