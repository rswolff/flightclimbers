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

			days = contest_week.day_ids

			contest.contestants.each do |contestant|
				contestant_week = ContestantWeek.where(contest_week_id: contest_week.id, contestant_id: contestant.id).first
				
				contestant_week.up_flights = 								Measurement.select("sum(number_of_flights) as sum_number_of_flights, days.date").joins(:day).where(:direction => 'up', :day_id => days, :user_id => contestant.id).first.sum_number_of_flights
				contestant_week.up_flights_extended_value = Measurement.select("sum(extended_value) as sum_extended_value, days.date").joins(:day).where(:direction => 'up', :day_id => days, :user_id => contestant.id).first.sum_extended_value
				
				contestant_week.down_flights = 								Measurement.select("sum(number_of_flights) as sum_number_of_flights, days.date").joins(:day).where(:direction => 'down', :day_id => days, :user_id => contestant.id).first.sum_number_of_flights
				contestant_week.down_flights_extended_value = Measurement.select("sum(extended_value) as sum_extended_value, days.date").joins(:day).where(:direction => 'down', :day_id => days, :user_id => contestant.id).first.sum_extended_value
				
				contestant_week.total_flights = 								Measurement.select("sum(number_of_flights) as sum_number_of_flights, days.date").joins(:day).where(:day_id => days, :user_id => contestant.id).first.sum_number_of_flights
				contestant_week.total_flights_extended_value = 	Measurement.select("sum(extended_value) as sum_extended_value, days.date").joins(:day).where(:day_id => days, :user_id => contestant.id).first.sum_extended_value
				
				contestant_week.save
			end

		end
	end
end
