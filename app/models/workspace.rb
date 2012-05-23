class Workspace < ActiveRecord::Base
  belongs_to :context
  has_many :tasks, :dependent => :destroy, :inverse_of => :workspace
  has_many :task_statuses, :dependent => :destroy, :inverse_of => :workspace
  belongs_to :default_status, :class_name => 'TaskStatus', :foreign_key => :default_status_id

  attr_accessible :name

  validates_presence_of :context
  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order{lower name}
end
