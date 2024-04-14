class TagMap < ApplicationRecord
  belongs_to :nihon
  belongs_to :tag

  
  validates :nihon_id, presence: true
  validates :tag_id, presence: true

end
