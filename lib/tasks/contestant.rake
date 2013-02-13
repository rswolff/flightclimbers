namespace :users do
	task :calculate_contestant_day_sums => :environment do
		contest = Contest.find(ENV["CONTEST_ID"])

		contest.contest_days.each do |contest_day|

			contest.contestants.each do |contestant|
				
				contestant_day = ContestantDay.where(contestant_id: contestant.id, contest_day_id: contest_day.id).first

				contestant_day.up_flights = Measurement.sum(:number_of_flights, :conditions => ["day_id = ? AND user_id = ? AND direction = 'up'", contest_day.day_id, contestant.id])
				contestant_day.up_flights_extended_value = Measurement.sum(:extended_value, :conditions => ["day_id = ? AND user_id = ? AND direction = 'up'", contest_day.day_id, contestant.id])
				contestant_day.down_flights = Measurement.sum(:number_of_flights, :conditions => ["day_id = ? AND user_id = ? AND direction = 'down'", contest_day.day_id, contestant.id])
				contestant_day.down_flights_extended_value = Measurement.sum(:extended_value, :conditions => ["day_id = ? AND user_id = ? AND direction = 'down'", contest_day.day_id, contestant.id])
				contestant_day.total_flights = Measurement.sum(:number_of_flights, :conditions => ["day_id = ? AND user_id = ?", contest_day.day_id, contestant.id])
				contestant_day.total_flights_extended_value = Measurement.sum(:extended_value, :conditions => ["day_id = ? AND user_id = ?", contest_day.day_id, contestant.id])

				contestant_day.save
			end
		end

	end

	task :calculate_contestant_week_sums => :environment do 
		contest = Contest.find(ENV["CONTEST_ID"])

		contest.contest_weeks.each do |contest_week|

			days = contest_week.day_ids.join(",")

			contest.contestants.each do |contestant|
				contestant_week = ContestantWeek.where(contest_week_id: contest_week.id, contestant_id: contestant.id).first
				contestant_week.up_flights = Measurement.sum(:number_of_flights, :conditions => ["day_id IN (?) AND user_id = ? AND direction = 'up'", days, contestant.id])
				contestant_week.up_flights_extended_value = Measurement.sum(:extended_value, :conditions => ["day_id IN (?) AND user_id = ? AND direction = 'up'", days, contestant.id])
				contestant_week.down_flights = Measurement.sum(:number_of_flights, :conditions => ["day_id IN (?) AND user_id = ? AND direction = 'down'", days, contestant.id])
				contestant_week.down_flights_extended_value = Measurement.sum(:extended_value, :conditions => ["day_id IN (?) AND user_id = ? AND direction = 'down'", days, contestant.id])
				contestant_week.total_flights = Measurement.sum(:number_of_flights, :conditions => ["day_id IN (?) AND user_id = ?", days, contestant.id])
				contestant_week.total_flights_extended_value = Measurement.sum(:extended_value, :conditions => ["day_id IN (?) AND user_id = ?", days, contestant.id])
				contestant_week.save
			end

		end
	end
end
