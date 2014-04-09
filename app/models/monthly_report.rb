class MonthlyReport < ActiveRecord::Base
  has_many :daily_reports, dependent: :destroy
  belongs_to :user

  validates :year,
    presence: true,
    numericality: { greater_than_or_equal_to: 1970, only_integer: true }
  validates :month,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 ,only_integer: true },
    uniqueness: { scope: [:user_id, :year]}
  validates :user_id,
    presence: true

  def self.count_by_years(year, month)
    where(year: year, month: month)[0].daily_reports.count
  end

  def self.pomodori_sum_by_years(year, month)
    where(year: year, month: month)[0].daily_reports.sum(:pomodori)
  end

  def self.task_sum_by_years(year, month)
    where(year: year, month: month)[0].daily_reports.sum(:task)
  end

  def self.pomodori_average_by_years(year, month)
    count = count_by_years(year, month)
    if count != 0
      pomodori_sum_by_years(year, month) / count.to_f
    else
      0
    end
  end

  def self.task_average_by_years(year, month)
    count = count_by_years(year, month)
    if count != 0
      task_sum_by_years(year, month) / count.to_f
    else
      0
    end
  end

end
