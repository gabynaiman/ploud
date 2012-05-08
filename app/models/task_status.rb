class TaskStatus < ActiveRecord::Base
  belongs_to :context, :autosave => true

  attr_accessible :name, :default

  validates_presence_of :context
  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order('LOWER(name)')

  def default
    context.default_status == self
  end

  def default=(value)
    is_default = value == '1' || value == true
    if default && !is_default
      context.default_status = nil
    elsif !default && is_default
      context.default_status = self
    end
  end
end
