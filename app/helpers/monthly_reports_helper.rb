module MonthlyReportsHelper

  def count_by_years(year, month)
    MonthlyReport.count_by_years(year, month)
  end

  def pomodori_sum_by_years(year, month)
    MonthlyReport.pomodori_sum_by_years(year, month)
  end

  def pomodori_average_by_years(year, month)
    MonthlyReport.pomodori_average_by_years(year, month)
  end

  def task_sum_by_years(year, month)
    MonthlyReport.task_sum_by_years(year, month)
  end

  def task_average_by_years(year, month)
    MonthlyReport.task_average_by_years(year, month)
  end
end
