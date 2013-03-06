class Award < ActiveRecord::Base
  attr_accessible :badge_id, :contestable_id, :contestable_type, :contestant_id
  belongs_to :badge
  belongs_to :contestant

  belongs_to :contestable, :polymorphic => true

end
