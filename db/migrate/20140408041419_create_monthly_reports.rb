class CreateMonthlyReports < ActiveRecord::Migration
  def change
    create_table :monthly_reports do |t|
      t.integer :year
      t.integer :month
      t.string :memo
      t.references :user, index: true

      t.timestamps
    end
  end
end
