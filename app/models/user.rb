class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :contest_id, :registration_fee_paid, :accept_terms, :email, :password, :password_confirmation

  belongs_to :contest
  has_many :measurements

  authenticates_with_sorcery!
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  ROLES = %w[admin]

  default_scope order("last_name, first_name")

  def full_name
  	first_name + " " + last_name
  end

  def full_name_last_name_first
  	last_name + ", " + first_name
  end

  def up_flights
    measurements.where(direction: 'up').sum(:extended_value).to_s
  end

  def down_flights
    measurements.where(direction: 'down').sum(:extended_value).to_s
  end

  def flights
    measurements.sum(:extended_value).to_s
  end

  def t(direction)
    Measurement.select("days.date, direction, sum(extended_value) as direction_sum").joins(:day).where("days.date BETWEEN ? AND ?", self.contest.start_date, Date.today).where(:user_id => self.id).where(:direction => direction).order("days.date DESC").group("direction, days.date")
  end
end