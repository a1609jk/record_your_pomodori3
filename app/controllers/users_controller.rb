class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def show
    @user = User.find(params[:id])
    @monthly_reports = @user.monthly_reports.paginate(page: params[:page]).order('year DESC, month DESC')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user, notice: 'Welcome to Record Your Pomodori!'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザーの情報を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'ユーザーの情報を削除しました'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "サインインしてください" unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
