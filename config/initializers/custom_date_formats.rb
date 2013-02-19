Date::DATE_FORMATS.merge!(
  :short_date => "%Y/%m/%d",
  :med_date => "%d-%b-%Y",
  :long_date => "%A %B %d, %Y",
  :military_date => "%H%M"  
)

Time::DATE_FORMATS.merge!(
  :med_time => "%d-%b-%Y",
  :military_time => "%H%M",
  :long_time => "%A %B %d, %Y %I:%M %p",
  :short_time => "%I:%M %p"  
)
