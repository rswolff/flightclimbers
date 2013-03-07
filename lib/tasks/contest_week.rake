namespace :contest_week do
	task :calculate_averages => :environment do 
		contest_week = ContestWeek.find(ENV["CONTEST_WEEK_ID"])
		contest_week.average_number_of_flights_up = ContestWeek.average_number_of_flights_up(contest_week.contest, contest_week.day_ids)
		contest_week.average_extended_value_up = ContestWeek.average_extended_value_up(contest_week.contest, contest_week.day_ids)
		contest_week.average_number_of_flights_down = ContestWeek.average_number_of_flights_down(contest_week.contest, contest_week.day_ids)
		contest_week.average_extended_value_down = ContestWeek.average_extended_value_down(contest_week.contest, contest_week.day_ids)
		contest_week.average_number_of_flights_total = ContestWeek.average_number_of_flights_total(contest_week.contest, contest_week.day_ids)
		contest_week.average_extended_value_total = ContestWeek.average_extended_value_total(contest_week.contest, contest_week.day_ids)
		contest_week.save
	end

	task :calculate_winner => :environment do 
		contest_week = ContestWeek.find(ENV["CONTEST_WEEK_ID"])
		contest = contest_week.contest

		high_score = 0
		winner = nil 

		contest.contestants.each do |contestant|
			puts "contestant: #{contestant.full_name}"
			contestant_week = ContestantWeek.where(contestant_id: contestant.id, contest_week_id: contest_week.id).first
			contestant_day_ids = contestant_week.contestant_day_ids
			contestant_score = ContestantDay.select("SUM(total_flights_extended_value) as sum_total_flights_extended_value").where(:id => contestant_day_ids).order("total_flights_extended_value DESC").limit(4).first.sum_total_flights_extended_value
			puts "contestant_score: contestant_score"		
			if contestant_score && (contestant_score > high_score)
				high_score = contestant_score
				winner = contestant 
				puts "high_score: #{high_score}"
				puts "winner: #{winner.full_name}"
			end
		end

		contest_week.user_id = winner.id
		contest_week.save

	end

	task :award_badges => :environment do
		contest_week = ContestDay.find(ENV["ID"])

		up_contestant = contest_week.max_up_contestant
		down_contestant = contest_week.max_down_contestant
		total_contestant = contest_week.max_total_contestant
		
		Badge.find(4).award(up_contestant.user_id, 'ContestWeek', contest_week.id) unless up_contestant.nil? #most up
		Badge.find(5).award(down_contestant.user_id, 'ContestWeek', contest_week.id) unless down_contestant.nil? #most down
		Badge.find(9).award(total_contestant.user_id, 'ContestWeek', contest_week.id) unless total_contestant.nil? #most total		

	end
end