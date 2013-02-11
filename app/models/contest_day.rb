class ContestDay < ActiveRecord::Base
  attr_accessible :contest_id, :contest_week_id, :day_id
  belongs_to :contest
  belongs_to :day
  belongs_to :contest_week
end

#get the number of up/down in a contest week
#ContestWeek.select("SUM(measurements.extended_value) as extended_value").joins(:contest_week_days => {:day => {:measurements => :user}}).where("users.id = 10 AND contest_weeks.id = 53")
