class Context < ActiveRecord::Base
  belongs_to :project

  attr_accessible :name

  validates_presence_of :name
end
