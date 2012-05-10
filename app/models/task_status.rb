class TaskStatus < ActiveRecord::Base
  belongs_to :context, :inverse_of => :task_statuses

  attr_accessible :name, :default, :todo

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
      context.update_attribute :default_status, nil
    elsif !default && is_default
      context.update_attribute :default_status, self
    end
  end
end
