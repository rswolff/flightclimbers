class Contestant < User
	has_many :contestant_day
	has_many :measurements, :foreign_key => 'user_id'
	has_many :contestant_days 
	has_many :contestant_weeks
	has_many :contest_weeks, :foreign_key => 'user_id'
	belongs_to :contest

	after_create :initialize_contestant_days, :initialize_contestant_weeks

	def up
		Measurement.select("SUM(extended_value) as extended_value").where(user_id: self.id, direction: 'up').first.extended_value.to_s
	end

	def down
		Measurement.select("SUM(extended_value) as extended_value").where(user_id: self.id, direction: 'down').first.extended_value.to_s		
	end

	def total
		Measurement.select("SUM(extended_value) as extended_value").where(user_id: self.id).first.extended_value.to_s
	end

	def initialize_contestant_days
		ContestDay.where(contest_id: self.contest.id).each do |contest_day|
      ContestantDay.create(contestant_id: self.id, day_id: contest_day.day_id)
    end
	end

	def initialize_contestant_weeks
		(self.contest.contest_weeks).each do |contest_week|
			ContestantWeek.create(contestant_id: self.id, contest_week_id: contest_week.id)
		end
	end

end
