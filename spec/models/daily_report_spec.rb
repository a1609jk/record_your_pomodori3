require 'spec_helper'

describe DailyReport do

  it "has valid factory" do
    expect(build(:daily_report)).to be_valid
  end

  describe "attributes" do

    let(:daily_report) { build(:daily_report) }

    it "has day" do
      expect(daily_report).to respond_to(:day)
    end

    it "has pomodori" do
      expect(daily_report).to respond_to(:pomodori)
    end

    it "has task" do
      expect(daily_report).to respond_to(:task)
    end

    it "has memo" do
      expect(daily_report).to respond_to(:memo)
    end

    it "has monthly_report" do
      expect(daily_report).to respond_to(:monthly_report)
    end
  end

  it "is invalid without day" do
    expect(
      build(:daily_report, day: nil)
    ).to have(2).errors_on(:day)
  end

  it "is invalid without pomodori" do
    expect(
      build(:daily_report, pomodori: nil)
    ).to have(2).errors_on(:pomodori)
  end

  it "is invalid without task" do
    expect(
      build(:daily_report, task: nil)
    ).to have(2).errors_on(:task)
  end
 
  it "is invalid without monthly_report_id" do
    expect(
      build(:daily_report, monthly_report_id: nil)
    ).to have(1).errors_on(:monthly_report_id)
  end

  it "is invalid if day less than 1" do
    expect(
      build(:daily_report, day: 0)
    ).to have(1).errors_on(:day)
  end

  it "is invalid if day greater than 31" do
    expect(
      build(:daily_report, day:32)
    ).to have(1).errors_on(:day)
  end

  it "is invalid if day is decimal" do
    expect(
            build(:daily_report, day: 1.1)
    ).to have(1).errors_on(:day)
  end

  it "is invalid if pomodori less than 0" do
    expect(
      build(:daily_report, pomodori: -1)
    ).to have(1).errors_on(:pomodori)
  end

  it "is invalid if pomoodri is decimal" do
    expect(
            build(:daily_report, pomodori: 1.1)
    ).to have(1).errors_on(:pomodori)
  end

  it "is invalid if taks less than 0" do
    expect(
      build(:daily_report, task: -1)
    ).to have(1).errors_on(:task)
  end

  it "is invalid if task is decimal" do
    expect(
            build(:daily_report, task: 1.1)
    ).to have(1).errors_on(:task)
  end

  it "is invalid with day dupulicate in same month" do
    create(:daily_report, day: 1, monthly_report_id: 1)
    expect(
      build(:daily_report, day: 1, monthly_report_id: 1)
    ).to have(1).errors_on(:day)
  end
end
