class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update]
  
  def show
    @user = User.find(params[:id])
    @monthly_reports = @user.monthly_reports.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Welcome to Record Your Pomodori!'
    else
      render 'new'
    end
    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "サインインしてください" unless signed_in?
    end
end
