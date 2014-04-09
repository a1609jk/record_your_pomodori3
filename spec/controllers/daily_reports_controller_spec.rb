require 'spec_helper'

describe DailyReportsController do

  describe 'GET #new' do

    before :each do
      monthly_report = create(:monthly_report)
      get :new, monthly_report_id: monthly_report.id, user_id: monthly_report.user.id
    end

    it "assigns a new daily report to @daily_report" do
      expect(assigns(:daily_report)).to be_a_new(DailyReport)
    end

    it "renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do

    before :each do
      @daily_report = build(:daily_report)
    end
    
    context "with valid attributes" do
      it "saves the new daily report in the database" do
        expect{
          post :create, daily_report: attributes_for(:daily_report),
            monthly_report_id: @daily_report.monthly_report.id,
            user_id: @daily_report.monthly_report.user.id
        }.to change(DailyReport, :count).by(1)
      end

      it "redirects to monthly_reports#show" do
        post :create, daily_report: attributes_for(:daily_report),
          monthly_report_id: @daily_report.monthly_report.id,
          user_id: @daily_report.monthly_report.user.id
        expect(response).to redirect_to user_monthly_report_path(
          @daily_report.monthly_report.user,
          @daily_report.monthly_report
        )
      end
    end

    context "with invalid attributes" do
      it "does not save the daily report in the database" do
        expect{
          post :create, daily_report: attributes_for(:daily_report, day: nil),
            monthly_report_id: @daily_report.monthly_report.id,
            user_id: @daily_report.monthly_report.user.id
        }.to_not change(DailyReport, :count)
      end

      it "re-renders the :new template" do
        post :create, daily_report: attributes_for(:daily_report, day: nil),
          monthly_report_id: @daily_report.monthly_report.id,
          user_id: @daily_report.monthly_report.user.id
        expect(response).to render_template(:new)
      end
    end
  end

end
