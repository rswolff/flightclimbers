class Badge < ActiveRecord::Base
  
	INTERVALS = %w(daily weekly)

  attr_accessible :description, :name
  has_many :awards
  has_many :contests, :through => :awards

  def award(contestant_id, contestable, contestable_id)
  	Award.create(badge_id: self.id, contestant_id: contestant_id, contestable_type: contestable, contestable_id: contestable_id )
  end

end
