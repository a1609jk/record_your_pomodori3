class DailyReport < ActiveRecord::Base
  belongs_to :monthly_report

  validates :day,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31, only_integer: true },
    uniqueness: { scope: :monthly_report_id }
  validates :pomodori,
    presence: true,
    numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :task,
    presence: true,
    numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :monthly_report_id,
    presence: true
end
