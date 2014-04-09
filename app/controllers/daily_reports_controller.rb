class DailyReportsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:monthly_report_id])
    @daily_report = @monthly_report.daily_reports.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:monthly_report_id])
    @daily_report = @monthly_report.daily_reports.new(daily_report_params)

    if @daily_report.save
      redirect_to user_monthly_report_path(@user, @monthly_report)
    else
      render action: 'new'
    end
  end

  private

    def daily_report_params
      params.require(:daily_report).permit(:day, :pomodori, :task, :memo)
    end
end
