class DailyReportsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:monthly_report_id])
    @daily_report = @monthly_report.daily_reports.new
    render :new
  end
end
