class Context < ActiveRecord::Base
  belongs_to :project
  has_many :task_statuses, :dependent => :destroy
  has_many :tasks, :dependent => :destroy

  attr_accessible :name

  validates_presence_of :project
  validates_presence_of :name

  acts_as_auditable
end
