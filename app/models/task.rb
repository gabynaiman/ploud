class Task < ActiveRecord::Base
  belongs_to :context
  belongs_to :task_status

  attr_accessible :description, :name, :task_status_id

  validates_presence_of :name

  acts_as_auditable

  scope :ordered, order('LOWER(tasks.name)')
  scope :drafts_of, lambda { |user| where(:context_id => nil).where(:created_by => user) }
  scope :todo, joins{task_status}.joins{context.project}.where{task_status.todo == true}.where{context.project.project_status.in(ProjectStatus.active_values)}

  def update_context(context_id)
    self.context = Context.find(context_id)
    self.task_status = self.context.default_status
    save
  end
end
