class MonthlyReport < ActiveRecord::Base
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
end
