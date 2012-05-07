class Task < ActiveRecord::Base
  belongs_to :context
  belongs_to :task_status

  attr_accessible :description, :name, :task_status_id

  validates_presence_of :name

  acts_as_auditable
end
