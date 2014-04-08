require 'spec_helper'

describe MonthlyReportsController do

  describe 'GET #new' do

    before :each do
      user = create(:user)
      get :new, user_id: user.id
    end

    it "assigns a new monthly report to @monthly_report" do
      expect(assigns(:monthly_report)).to be_a_new(MonthlyReport)
    end

    it "renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do

    before :each do
      @monthly_report = build(:monthly_report)
    end

    context "with valid attributes" do

      it "saves the new monthly report in the database" do
        expect{
          post :create, monthly_report: attributes_for(:monthly_report),
            user_id: @monthly_report.user_id
        }.to change(MonthlyReport, :count).by(1)
      end

      it "redirects to users#show" do
        post :create, monthly_report: attributes_for(:monthly_report),
          user_id: @monthly_report.user_id
        expect(response).to redirect_to user_path(@monthly_report.user)
      end
    end

    context "with invalid attributes" do

      it "does not save the monthly report in the database" do
        expect{
          post :create, monthly_report: attributes_for(:monthly_report, year: nil),
            user_id: @monthly_report.user_id
        }.to_not change(MonthlyReport, :count)
      end

      it "re-renders the :new template" do
        post :create, monthly_report: attributes_for(:monthly_report, year: nil),
          user_id: @monthly_report.user_id
        expect(response).to render_template(:new)
      end
    end
  end

end
