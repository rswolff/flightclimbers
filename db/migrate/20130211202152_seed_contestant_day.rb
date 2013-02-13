class SeedContestantDay < ActiveRecord::Migration
  def up
    puts "Delete existing ContestDays."
    ContestDay.delete_all
    ContestWeek.delete_all
    Contest.all.each do |contest|
      puts "Initializing contest weeks for contest_id #{contest.id}."
      contest.initialize_contest_weeks
      #contest.contest_weeks.each do |contest_week|
      #  puts "Initializing contest days for contest_week #{contest_week.id}."
      #  contest_week.initialize_contest_days
      #end
    end
  end

  def down
    ContestDay.delete_all
    ContestWeek.delete_all
  end
end
