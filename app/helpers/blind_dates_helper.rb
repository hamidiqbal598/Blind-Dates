module BlindDatesHelper

  def friday_date
    Date.today.next_day((5 - Date.today.wday) % 7)
  end

  def friday_time_12
    friday = friday_date
    DateTime.new(friday.year, friday.month, friday.day, 12, 0, 0)
  end

  def time_format(date)
    date.strftime("%d-%m-%Y %H:%M")
  end

end
