class Project < ActiveRecord::Base
  has_many :contexts, :dependent => :destroy

  attr_accessible :description, :name, :project_status

  validates_presence_of :name
  validates_inclusion_of :project_status, :in => ProjectStatus.all_values

  acts_as_auditable

  scope :ordered, order('LOWER(name)')
  scope :active, where{project_status.in ProjectStatus.active_values}

  def status_name
    ProjectStatus.new(project_status).name unless project_status.nil?
  end
end
