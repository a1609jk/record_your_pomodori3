class MonthlyReportsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]

  def show
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.new
  end

  def create
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.new(monthly_report_params)

    if @monthly_report.save
      redirect_to user_path(@user),
        notice: '月間レポートは正しく登録されました'
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:id])

    if @monthly_report.update(monthly_report_params)
      redirect_to user_path(@user),
        notice: '月間レポートは正しく更新されました'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:id])
    @monthly_report.destroy

    redirect_to user_path(@user),
      notice: '月間レポートは正しく削除されました'
  end

  private

    def monthly_report_params
      params.require(:monthly_report).permit(:year, :month, :memo)
    end

    def signed_in_user
      redirect_to signin_url, notice: 'サインインしてください' unless signed_in?
    end

    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
