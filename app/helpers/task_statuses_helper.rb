module TaskStatusesHelper

  def task_status_breadcrumbs
    content_for :breadcrumbs do
      concat(breadcrumb(@workspace.context.name, @workspace.context))
      concat(breadcrumb('Contexts', context_workspaces_path(@workspace.context)))
      concat(breadcrumb(@workspace.name, [@workspace.context, @workspace]))
    end
  end


end