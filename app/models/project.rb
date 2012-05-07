class Project < ActiveRecord::Base
  attr_accessible :description, :name, :status

  validates_presence_of :name
  validates_inclusion_of :status, :in => ProjectStatus.all_values

  def status_name
    ProjectStatus.new(status).name unless status.nil?
  end
end
