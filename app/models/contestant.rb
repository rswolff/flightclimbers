class Contestant < User
	has_many :contestant_day
	has_many :measurements, :foreign_key => 'user_id'
	has_many :contestant_days 
	has_many :contestant_weeks 

	after_create :initialize_contestant_days, :initialize_contestant_weeks

	def initialize_contestant_days
		ContestWeekDay.where(contest_id: self.contest.id).each do |contest_day|
      ContestantDay.create(contestant_id: self.id, day_id: contest_day.day_id)
    end
	end

	def initialize_contestant_weeks
		(self.contest.contest_weeks).each do |contest_week|
			ContestantWeek.create(contestant_id: self.id, contest_week_id: contest_week.id)
		end
	end

end
