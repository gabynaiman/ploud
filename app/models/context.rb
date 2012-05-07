class Context < ActiveRecord::Base
  belongs_to :project
  has_many :task_statuses

  attr_accessible :name

  validates_presence_of :project
  validates_presence_of :name
end
