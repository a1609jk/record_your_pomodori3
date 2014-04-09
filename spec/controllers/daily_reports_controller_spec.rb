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

  describe 'GET #edit' do

    before :each do
      @daily_report = create(:daily_report)
      get :edit, id: @daily_report, monthly_report_id: @daily_report.monthly_report,
        user_id: @daily_report.monthly_report.user
    end

    it "assigns the requested daily report to @daily_report" do
      expect(assigns(:daily_report)).to eq @daily_report
    end

    it "renders the :edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do

    before :each do
      @daily_report = create(:daily_report)
    end

    context "with valid attributes" do

      before :each do
        patch :update, id: @daily_report, monthly_report_id: @daily_report.monthly_report,
          user_id: @daily_report.monthly_report.user,
          daily_report: attributes_for(:daily_report, pomodori: 20, task: 20)
      end

      it "changes @daily_report's attributes" do
        @daily_report.reload
        expect(@daily_report.pomodori).to eq 20
        expect(@daily_report.task).to eq 20
      end

      it "redirects to monthly_reports#show" do
        expect(response).to redirect_to user_monthly_report_path(
          @daily_report.monthly_report.user,
          @daily_report.monthly_report
        )
      end
    end

    context "with invalid attributs" do

      before :each do
        patch :update, id: @daily_report, monthly_report_id: @daily_report.monthly_report,
          user_id: @daily_report.monthly_report.user,
          daily_report: attributes_for(:daily_report, pomodori: nil, task: nil)
      end

      it "does not changes @daily_report's attributes" do
        @daily_report.reload
        expect(@daily_report.pomodori).to_not eq nil
        expect(@daily_report.task).to_not eq nil
      end

      it "re-renders the :edit template" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do

    before :each do
      @daily_report = create(:daily_report)
    end
    
    it "deletes the daily report" do
      expect{
        delete :destroy, id: @daily_report, monthly_report_id: @daily_report.monthly_report,
          user_id: @daily_report.monthly_report.user
      }.to change(DailyReport, :count).by(-1)
    end

    it "redirects to monthly_report#show" do
      delete :destroy, id: @daily_report, monthly_report_id: @daily_report.monthly_report,
        user_id: @daily_report.monthly_report.user
      expect(response).to redirect_to user_monthly_report_path(
        @daily_report.monthly_report.user,
        @daily_report.monthly_report
      )
    end
  end
end
