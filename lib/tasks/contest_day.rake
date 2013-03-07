namespace :contest_day do
	task :award_badges => :environment do
		contest_day = ContestDay.find(ENV["CONTEST_DAY_ID"])
		up_contestant = contest_day.max_up_contestant
		down_contestant = contest_day.max_down_contestant
		total_contestant = contest_day.max_total_contestant
			
		Badge.find(1).award(up_contestant.user_id, 'ContestDay', contest_day.id) unless up_contestant.nil? #most up
		Badge.find(2).award(down_contestant.user_id, 'ContestDay', contest_day.id) unless down_contestant.nil? #most down
		Badge.find(3).award(total_contestant.user_id, 'ContestDay', contest_day.id) unless total_contestant.nil? #most total
	end

	task :award_personal_best => :environment do |contestant_id|

		contest = Contest.find(ENV["ID"])

		#the first run should compute all personal bests

		contest.contest_days.each do |contest_day|
			contest.contestants.each do |contestant|
				#calculate personal best up
					up = contestant.measurements.where(direction: 'up', day_id: contest_day.day_id).sum(:extended_value)
					if contestant.best_up_day_id.nil?
						contestant.best_up_day_id = contest_day.day_id
					else
						if contestant.best_up_day_id < up
							contestant.best_up_day_id = contest_day.day.id
						end
					end

				#calculate personal best down

				#calculate personal best total
			end
		end

	end

end