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
end
