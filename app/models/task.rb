class Task < ActiveRecord::Base
  belongs_to :context, :inverse_of => :tasks
  belongs_to :task_status

  attr_accessible :context_id, :name, :description, :task_status_id, :priority

  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order{lower name}
  scope :priorized, order{(priority * (ActiveRecord::Base.connection.adapter_name == 'SQLite' ? -1 : 1)).desc}
  scope :drafts_of, lambda { |user| where(:context_id => nil).where(:created_by => user) }
  scope :todo, joins{task_status}.joins{context.project}.where{task_status.todo == true}.where{context.project.project_status.in(ProjectStatus.active_values)}

  before_save :after_change_context

  def after_change_context
    self.task_status = self.context.default_status if context_id_changed?
  end

end
