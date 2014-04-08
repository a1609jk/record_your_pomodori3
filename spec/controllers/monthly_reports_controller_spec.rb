require 'spec_helper'

describe MonthlyReportsController do

  describe 'GET #new' do

    before :each do
      controller.stub!(:signed_in?).and_return(true)
      controller.stub!(:current_user?).and_return(true)
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
      controller.stub!(:signed_in?).and_return(true)
      controller.stub!(:current_user?).and_return(true)
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

  describe 'GET #edit' do

    before :each do
      controller.stub!(:signed_in?).and_return(true)
      controller.stub!(:current_user?).and_return(true)
      @monthly_report = create(:monthly_report)
      get :edit, id: @monthly_report, user_id: @monthly_report.user.id
    end

    it "assigns the required monthy report to @monthly_report" do
      expect(assigns(:monthly_report)).to eq @monthly_report
    end

    it "renders the :edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do

    before :each do
      controller.stub!(:signed_in?).and_return(true)
      controller.stub!(:current_user?).and_return(true)
      @monthly_report = create(:monthly_report)
    end

    context "with valid attributes" do

      before :each do
        patch :update, id: @monthly_report, user_id: @monthly_report.user.id,
          monthly_report: attributes_for(:monthly_report, year: 2015, month: 5)
      end

      it "changes @monthly_report's attributes" do
        @monthly_report.reload
        expect(@monthly_report.year).to eq(2015)
        expect(@monthly_report.month).to eq(5) 
      end

      it "redirects to users#show" do
        expect(response).to redirect_to user_path(@monthly_report.user.id)
      end
    end

    context "with invalid attributes" do

      before :each do
        patch :update, id: @monthly_report, user_id: @monthly_report.user.id,
          monthly_report: attributes_for(:monthly_report, year: " ", month: " ")
      end

      it "does not changes @monthly_report's attributes" do
        @monthly_report.reload
        expect(@monthly_report.year).to_not eq(" ")
        expect(@monthly_report.month).to_not eq(" ")
      end

      it "re-renders the :edit template'" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do

    before :each do
      controller.stub!(:signed_in?).and_return(true)
      controller.stub!(:current_user?).and_return(true)
      @monthly_report = create(:monthly_report)
    end

    it "deletes the monthly report" do
      expect{
        delete :destroy, id: @monthly_report, user_id: @monthly_report.user.id
      }.to change(MonthlyReport, :count).by(-1)
    end

    it "redirects to users#show" do
      delete :destroy, id: @monthly_report, user_id: @monthly_report.user.id
      expect(response).to redirect_to user_path(@monthly_report.user.id)
    end
  end

end
