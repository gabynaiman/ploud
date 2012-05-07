module TaskStatusesHelper

  def task_status_breadcrumbs
    content_for :breadcrumbs do
      concat(breadcrumb(@context.project.name, @context.project))
      concat(breadcrumb('Contexts', project_contexts_path(@context.project)))
      concat(breadcrumb(@context.name, [@context.project, @context]))
    end
  end


end