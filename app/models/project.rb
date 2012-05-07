class Project < ActiveRecord::Base
  has_many :contexts, :dependent => :destroy

  attr_accessible :description, :name, :project_status

  validates_presence_of :name
  validates_inclusion_of :project_status, :in => ProjectStatus.all_values

  acts_as_auditable

  def status_name
    ProjectStatus.new(project_status).name unless project_status.nil?
  end
end
