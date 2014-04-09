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

  def edit
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:monthly_report_id])
    @daily_report = @monthly_report.daily_reports.find(params[:id])
    render action: 'edit'
  end

  def update
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:monthly_report_id])
    @daily_report = @monthly_report.daily_reports.find(params[:id])

    if @daily_report.update(daily_report_params)
      redirect_to user_monthly_report_path(@user, @monthly_report)
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @monthly_report = @user.monthly_reports.find(params[:monthly_report_id])
    @daily_report = @monthly_report.daily_reports.find(params[:id])
    @daily_report.destroy
    redirect_to user_monthly_report_path(@user, @monthly_report)
  end

  private

    def daily_report_params
      params.require(:daily_report).permit(:day, :pomodori, :task, :memo)
    end
end
