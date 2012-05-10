class Context < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy, :inverse_of => :context
  has_many :task_statuses, :dependent => :destroy, :inverse_of => :context
  belongs_to :default_status, :class_name => 'TaskStatus', :foreign_key => :default_status_id

  attr_accessible :name

  validates_presence_of :project
  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order('LOWER(name)')
end
