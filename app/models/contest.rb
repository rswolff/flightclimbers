class Contest < ActiveRecord::Base
  attr_accessible :ascend_value, :descend_value, :end_date, :name, :registration_fee_cents, :registration_fee_currency, :start_date, :rules, :number_of_weeks
  monetize :registration_fee_cents

  has_many :users
  has_many :contestants
  has_many :contest_weeks
  has_many :contest_days

  after_create :initialize_contest_week

  def initialize_contest_week

  	week_count = 0
  	
  	(0..(number_of_weeks - 1)).each do |week|
			s = start_date + (week * 7) 
			e = s + 6 
  		cw = ContestWeek.create(contest_id: self.id, contest_week: week + 1, start_date: s, end_date: e)
		end

  end

  def contestant_ids
    contestants.pluck(:id)
  end

  def current_day
    self.contest_days.joins(:day).where(["days.date = ?", Date.today]).first
  end

  def current_week
    self.contest_weeks.where(["? >= contest_weeks.start_date AND ? <= contest_weeks.end_date", Date.today, Date.today]).first
  end

end
