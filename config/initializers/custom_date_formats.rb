Date::DATE_FORMATS.merge!(
  :short => "%Y/%m/%d",
  :med => "%d-%b-%Y",
  :long => "%A %B %d, %Y",
  :military => "%H%M"  
)

Time::DATE_FORMATS.merge!(
  :med => "%d-%b-%Y",
  :military => "%H%M",
  :short => "%I:%M %p"  
)
