class Task < ActiveRecord::Base
  belongs_to :workspace, :inverse_of => :tasks
  belongs_to :task_status

  attr_accessible :workspace_id, :name, :description, :task_status_id, :priority, :due_date

  validates_presence_of :name
  validate :due_date_after_now

  acts_as_auditable

  scope :ordered, order{lower name}
  scope :priorized, (ActiveRecord::Base.connection.adapter_name == 'SQLite') ? order{(priority * -1).desc} : order(:priority)
  scope :drafts_of, lambda { |user| where(:workspace_id => nil).where(:created_by => user) }
  scope :todo, joins{task_status}.joins{workspace.context}.where{task_status.todo == true}

  before_save :after_change_workspace

  def after_change_workspace
    self.task_status = self.workspace.default_status if workspace_id_changed?
  end

  def due_date_after_now
    errors.add(:due_date, "invalid due date") if due_date.present? && due_date < Time.now
  end

end
