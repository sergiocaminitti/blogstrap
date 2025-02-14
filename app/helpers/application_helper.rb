module ApplicationHelper
  def month_day_comma_year(datetime)
    datetime.strftime("%B %e, %Y")
  end
end
