class TaskStatus < ActiveRecord::Base
  belongs_to :context

  attr_accessible :name

  validates_presence_of :context
  validates_presence_of :name
end
