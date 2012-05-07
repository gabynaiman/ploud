module ContextsHelper

  def context_breadcrumbs
    content_for :breadcrumbs do
      breadcrumb @project.name, @project
    end
  end

end
