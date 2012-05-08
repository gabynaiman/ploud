class TodosController < ApplicationController

  def index
    @projects = Project.active.ordered
  end

  def update_status
    @task = Task.find(params[:id])
    @projects = nil

    if @task.update_attribute(:task_status_id, params[:task_status_id])
      @projects = Project.active.ordered
      flash[:notice] = 'Task was successfully updated.'
    else
      flash[:error] = @task.errors.full_messages.join
    end
  end

end