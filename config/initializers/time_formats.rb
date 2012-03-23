[Time::DATE_FORMATS, Date::DATE_FORMATS].each do |date_formats|
  date_formats[:default] = "%Y-%m-%d %H:%M:%S"
  date_formats[:date_only] = "%Y-%m-%d"
end