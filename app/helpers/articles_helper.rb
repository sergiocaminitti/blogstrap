module ArticlesHelper
  def month_day_comma_year(datetime)
    datetime.strftime("%B %e, %Y")
  end
  def month_day(datetime)
    datetime.strftime("%B %e")
  end
end
