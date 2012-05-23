class TaskStatus < ActiveRecord::Base
  belongs_to :workspace, :inverse_of => :task_statuses

  attr_accessible :name, :default, :todo

  validates_presence_of :workspace
  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order{lower name}

  def default
    workspace.default_status == self
  end

  def default=(value)
    is_default = value == '1' || value == true
    if default && !is_default
      workspace.update_attribute :default_status, nil
    elsif !default && is_default
      workspace.update_attribute :default_status, self
    end
  end
end
