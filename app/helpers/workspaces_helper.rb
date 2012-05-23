module WorkspacesHelper

  def workspace_breadcrumbs
    content_for :breadcrumbs do
      breadcrumb @context.name, @context
    end
  end

  def workspace_select_list
    select_list = {}
    Context.ordered.each do |context|
      select_list[context.name] = context.workspaces.where{default_status_id != nil}.ordered.map{ |c| [c.name, c.id] }
    end
    select_list
  end

end
