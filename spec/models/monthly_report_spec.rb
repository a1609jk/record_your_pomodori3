require 'spec_helper'

describe MonthlyReport do

  it "has valid factory" do
    expect(build(:monthly_report)).to be_valid
  end

  describe "attributes" do

    let(:monthly_report) { build(:monthly_report) }

    it "has year" do
      expect(monthly_report).to respond_to(:year)
    end

    it "has month" do
      expect(monthly_report).to respond_to(:month)
    end

    it "has memo" do
      expect(monthly_report).to respond_to(:memo)
    end

    it "has user_id" do
      expect(monthly_report).to respond_to(:user_id)
    end

    it "has daily_reports" do
      expect(monthly_report).to respond_to(:daily_reports)
    end
  end

  it "is invalid without year" do
    expect(
      build(:monthly_report, year: nil)
    ).to have(2).errors_on(:year)
  end

  it "is invalid without month" do
    expect(
      build(:monthly_report, month: nil)
    ).to have(2).errors_on(:month)
  end

  it "is invalid without user_id" do
    expect(
      build(:monthly_report, user_id: nil)
    ).to have(1).errors_on(:user_id)
  end

  it "is invalid if year is less than 1970" do
    expect(
      build(:monthly_report, year: 1969)
    ).to have(1).errors_on(:year)
  end

  it "is invalid if year is decimal" do
    expect(
            build(:monthly_report, year: 2014.1)
    ).to have(1).errors_on(:year)
  end

  it "is invalid if month is less than 1" do
    expect(
      build(:monthly_report, month: 0)
    ).to have(1).errors_on(:month)
  end

  it "is invalid if month is greater than 12" do
    expect(
      build(:monthly_report, month: 13)
    ).to have(1).errors_on(:month)
  end

  it "is invalid if month is decimal" do
    expect(
            build(:monthly_report, month: 1.1)
    ).to have(1).errors_on(:month)
  end

  it "is invalid with month duplicate in same year & same user" do
    create(:monthly_report, year: 2014, month: 4, user_id: 1)
    expect(
      build(:monthly_report, year: 2014, month: 4, user_id: 1)
    ).to have(1).errors_on(:month)
  end

  describe "summary information" do

    before :each do
      @monthly_report = create(:monthly_report, year: 2014, month: 4)
      @daily_report_1 = @monthly_report.daily_reports.create(
        day: 1, pomodori: 10, task: 8, memo: 'test'
      )
      @daily_report_2 = @monthly_report.daily_reports.create(
        day: 2, pomodori: 5, task: 4, memo: 'test'
      )
    end

    it "returns count of daily reports by years" do
      expect(MonthlyReport.count_by_years(
        @monthly_report.user, @monthly_report.year, @monthly_report.month
      )).to eq(2)
    end

    it "returns pomodori sum of daily reports by years" do
      expect(MonthlyReport.pomodori_sum_by_years(
        @monthly_report.user, @monthly_report.year, @monthly_report.month
      )).to eq(15)
    end

    it "returns task sum of daily reports by years" do
      expect(MonthlyReport.task_sum_by_years(
        @monthly_report.user, @monthly_report.year, @monthly_report.month
      )).to eq(12)
    end

    it "returns pomodori average of daily reports by years" do
      expect(MonthlyReport.pomodori_average_by_years(
        @monthly_report.user, @monthly_report.year, @monthly_report.month
      )).to eq(7.5)
    end

    it "returns task sum of daily reports by years" do
      expect(MonthlyReport.task_average_by_years(
        @monthly_report.user, @monthly_report.year, @monthly_report.month
      )).to eq(6)
    end

    context "there is no daily report" do
      
      before :each do
        @monthly_report_no_task = create(:monthly_report, year: 2014, month: 5)
      end

      it "returns 0 by pomodori average" do
        expect(MonthlyReport.pomodori_average_by_years(
          @monthly_report_no_task.user, @monthly_report_no_task.year, @monthly_report_no_task.month
        )).to eq(0)
      end

      it "returns 0 by task average" do
        expect(MonthlyReport.task_average_by_years(
          @monthly_report_no_task.user, @monthly_report_no_task.year, @monthly_report_no_task.month
        )).to eq(0)
      end
    end

  end
end
