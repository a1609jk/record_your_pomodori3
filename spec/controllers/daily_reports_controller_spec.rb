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

end
