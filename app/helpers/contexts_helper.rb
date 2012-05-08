module ContextsHelper

  def context_breadcrumbs
    content_for :breadcrumbs do
      breadcrumb @project.name, @project
    end
  end

  def context_select_list
    select_list = {}
    Project.active.ordered.each do |project|
      select_list[project.name] = project.contexts.where{default_status_id != nil}.ordered.map{ |c| [c.name, c.id] }
    end
    select_list
  end

end
