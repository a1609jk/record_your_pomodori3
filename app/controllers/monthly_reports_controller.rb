class MonthlyReportsController < ApplicationController

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

  private

    def monthly_report_params
      params.require(:monthly_report).permit(:year, :month, :memo)
    end
end
