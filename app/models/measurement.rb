class Measurement < ActiveRecord::Base
  attr_accessible :day_id, :direction, :extended_value, :number_of_flights, :user_id
  belongs_to :day
  belongs_to :user
  belongs_to :contestant, :foreign_key => :user_id

  DIRECTIONS = %w[up down]

  after_save :increment_contestant_day
  after_destroy :decrement_contestant_day

  scope :in_contest, lambda { | contest_id | joins(:user => :contest).where(["contests.id = ? AND measurements.created_at BETWEEN contests.start_date AND contests.end_date", contest_id])}
  scope :up, where(direction: 'up')
  scope :down, where(direction: 'down')

  def contest_day
    ContestDay.where(contest_id: self.contestant.contest.id, day_id: self.day_id).first
  end

  def contest_week
    contest_day.contest_week.id
  end

  private

  def increment_contestant_day

    contestant_day = contestant.contest.current_day
    contestant_week = contestant.contest.current_week
	
    #contestant_day = ContestantDay.get(day.id, user.id)
    #contestant_week = ContestantWeek.get(self.contest_week, user.id)

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

    contestant_day = ContestantDay.get(day.id, user.id)
    contestant_week = ContestantWeek.get(self.contest_week, user.id)
  	
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
    contestant_week.save
  end

end
