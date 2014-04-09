class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.integer :day
      t.integer :pomodori
      t.integer :task
      t.string :memo
      t.references :monthly_report, index: true

      t.timestamps
    end
  end
end
