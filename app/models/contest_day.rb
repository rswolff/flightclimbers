class ContestDay < ActiveRecord::Base
  attr_accessible :contest_id, :contest_week_id, :day_id
  belongs_to :contest
  belongs_to :day
  belongs_to :contest_week
  has_many :contesant_days

  def max_up_contestant
  	Measurement.select("SUM(extended_value) sum_extended_value, user_id").where(["day_id = ? AND direction = ?", self.day_id, 'up']).group(:user_id).order("sum_extended_value DESC").limit(1).first
  end

  def max_down_contestant
  	Measurement.select("SUM(extended_value) sum_extended_value, user_id").where(["day_id = ? AND direction = ?", self.day_id, 'down']).group(:user_id).order("sum_extended_value DESC").limit(1).first
  end

  def max_total_contestant
  	Measurement.select("SUM(extended_value) sum_extended_value, user_id").where(["day_id = ?", self.day_id]).group(:user_id).order("sum_extended_value DESC").limit(1).first
  end

end

#get the number of up/down in a contest week
#ContestWeek.select("SUM(measurements.extended_value) as extended_value").joins(:contest_week_days => {:day => {:measurements => :user}}).where("users.id = 10 AND contest_weeks.id = 53")
