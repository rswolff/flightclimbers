class Contestant < User
	has_many :measurements, :foreign_key => 'user_id'
	has_many :contestant_days 
	has_many :contestant_weeks
	has_many :contest_weeks, :foreign_key => 'user_id'
	belongs_to :contest
	has_many :awards
	has_many :badges, :through => :awards


	after_create :initialize_contestant_weeks

	def up
		Measurement.select("SUM(extended_value) as extended_value").where(user_id: self.id, direction: 'up').first.extended_value.to_s
	end

	def down
		Measurement.select("SUM(extended_value) as extended_value").where(user_id: self.id, direction: 'down').first.extended_value.to_s		
	end

	def total
		Measurement.select("SUM(extended_value) as extended_value").where(user_id: self.id).first.extended_value.to_s
	end

	def display_name
		display_name = ''
		if read_attribute(:display_name).present?
			display_name = read_attribute(:display_name)
		else
			display_name = full_name
		end

		unless registration_fee_paid
			display_name = display_name + "*"
		end

		display_name

	end

	def initialize_contestant_weeks
		(self.contest.contest_weeks).each do |contest_week|
			ContestantWeek.create(contestant_id: self.id, contest_week_id: contest_week.id)
		end
	end

end
