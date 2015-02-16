# config/initializers/time_formats.rb
Time::DATE_FORMATS[:my_custom_time_format] = "%I"
Time::DATE_FORMATS[:hour_only] = "%I %M"
Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }

#You can add your own formats to the Time::DATE_FORMATS hash. Use the format name as the hash key and either a strftime string or Proc instance that takes a time argument as the value.
#then do this
#formated_date = my_date.to_formatted_s(:my_custom_time_format)
#time.to_formatted_s(:hour_only)
#time.to_formatted_s(:long)          # => "January 18, 2007 06:10"

# == Adding your own datetime formats to to_formatted_s
# DateTime formats are shared with Time. You can add your own to the
# Time::DATE_FORMATS hash. Use the format name as the hash key and
# either a strftime string or Proc instance that takes a time or
# datetime argument as the value.