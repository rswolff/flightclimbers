namespace :contest_day do
	task :award_badges => :environment do
		contest = Contest.find(ENV["CONTEST_ID"])

		contest.contest_days.each do |contest_day|

			up_contestant = contest_day.max_up_contestant
			down_contestant = contest_day.max_down_contestant
			total_contestant = contest_day.max_total_contestant
			
			Badge.find(1).award(up_contestant.user_id, 'ContestDay', contest_day.id) unless up_contestant.nil? #most up
			Badge.find(2).award(down_contestant.user_id, 'ContestDay', contest_day.id) unless down_contestant.nil? #most down
			Badge.find(3).award(total_contestant.user_id, 'ContestDay', contest_day.id) unless total_contestant.nil? #most total

		end
	end
end