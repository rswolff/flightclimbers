class Measurement < ActiveRecord::Base
  attr_accessible :day_id, :direction, :extended_value, :number_of_flights, :user_id
  belongs_to :day
  belongs_to :user
  belongs_to :contestant, :foreign_key => :user_id

  DIRECTIONS = %w[up down]

  after_save :increment_contestant_day
  after_destroy :decrement_contestant_day

  def contest_day
    ContestWeekDay.where(contest_id: self.contestant.contest.id, day_id: self.day_id).first
  end

  def contest_week
    contest_day.contest_week.id
  end

  def increment_contestant_day

    #get the contestant day and week summaries
  	contestant_day = ContestantDay.where("day_id = ? AND contestant_id = ?", day.id, user.id).first
    contestant_week = ContestantWeek.where("contest_week_id =? AND contestant_id = ?", self.contest_week, user.id).first
  	
  	case self.direction
  	when 'up'

      #day
  		contestant_day.up_flights += self.number_of_flights
  		contestant_day.up_flights_extended_value += (self.number_of_flights * self.user.contest.ascend_value)
  		contestant_day.total_flights += self.number_of_flights
  		contestant_day.total_flights_extended_value += (self.number_of_flights * self.user.contest.ascend_value)

      #week
      contestant_week.up_flights += self.number_of_flights
      contestant_week.up_flights_extended_value += (self.number_of_flights * self.user.contest.ascend_value)
      contestant_week.total_flights += self.number_of_flights
      contestant_week.total_flights_extended_value += (self.number_of_flights * self.user.contest.ascend_value)

  	when 'down'

      #day
  		contestant_day.down_flights += self.number_of_flights
  		contestant_day.down_flights_extended_value += (self.number_of_flights * self.user.contest.descend_value)
  		contestant_day.total_flights += self.number_of_flights
  		contestant_day.total_flights_extended_value += (self.number_of_flights * self.user.contest.descend_value)

      #week
      contestant_week.down_flights += self.number_of_flights
      contestant_week.down_flights_extended_value += (self.number_of_flights * self.user.contest.descend_value)
      contestant_week.total_flights += self.number_of_flights
      contestant_week.total_flights_extended_value += (self.number_of_flights * self.user.contest.descend_value)
  	end

  	contestant_day.save
    contestant_week.save 

  end

  def decrement_contestant_day
  	contestant_day = ContestantDay.where("day_id = ? AND contestant_id = ?", day.id, user.id).first
  	
    case self.direction
  	when 'up'

      #day
  		contestant_day.up_flights -= self.number_of_flights
  		contestant_day.up_flights_extended_value -= (self.number_of_flights * self.user.contest.ascend_value)
  		contestant_day.total_flights -= self.number_of_flights
  		contestant_day.total_flights_extended_value -= (self.number_of_flights * self.user.contest.ascend_value)

      #week
      contestant_week.up_flights -= self.number_of_flights
      contestant_week.up_flights_extended_value -= (self.number_of_flights * self.user.contest.ascend_value)
      contestant_week.total_flights -= self.number_of_flights
      contestant_week.total_flights_extended_value -= (self.number_of_flights * self.user.contest.ascend_value)

  	when 'down'

      #day
  		contestant_day.down_flights -= self.number_of_flights
  		contestant_day.down_flights_extended_value -= (self.number_of_flights * self.user.contest.descend_value)
  		contestant_day.total_flights -= self.number_of_flights
  		contestant_day.total_flights_extended_value -= (self.number_of_flights * self.user.contest.descend_value)

      #week
      contestant_week.down_flights -= self.number_of_flights
      contestant_week.down_flights_extended_value -= (self.number_of_flights * self.user.contest.descend_value)
      contestant_week.total_flights -= self.number_of_flights
      contestant_week.total_flights_extended_value -= (self.number_of_flights * self.user.contest.descend_value)
  	end  	

  	contestant_day.save
  end

end
