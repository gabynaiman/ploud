class Context < ActiveRecord::Base
  has_many :workspaces, :dependent => :destroy

  attr_accessible :description, :name

  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order{lower name}

end
