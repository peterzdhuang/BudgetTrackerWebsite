class CalendarComponent < ViewComponent::Base
  def initialize(year:, month:, daily_totals:)
    @year = year
    @month = month
    @daily_totals = daily_totals
  end
end
