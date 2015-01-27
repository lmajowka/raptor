class Experiment < ActiveRecord::Base

  STATUSES = ['draft', 'published']

  scope :visible, -> { where("status = 'published' or status = 'draft'") }

  validates_presence_of :title
  validates_inclusion_of :status, in: STATUSES

  def published?
    published_until > Time.now
  end

  def css_class
    published? ? 'published' : 'draft'
  end

end

