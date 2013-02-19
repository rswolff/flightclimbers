class Talk < ActiveRecord::Base
  attr_accessible :contestant_id, :notes
  belongs_to :contestant

  default_scope order('created_at DESC')
end
