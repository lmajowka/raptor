class Change < ActiveRecord::Base
  belongs_to :variation

  validates_uniqueness_of :selector, scope: :variation_id

end
