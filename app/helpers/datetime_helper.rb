module DatetimeHelper

  def time_ago(time)
     distance_of_time_in_words(time, Time.zone.now)
  end


end






