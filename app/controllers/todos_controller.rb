class TodosController < ApplicationController

  def index
    @contexts = Context.ordered
  end

  def update_status
    @task = Task.find(params[:id])
    @contexts = nil

    if @task.update_attribute(:task_status_id, params[:task_status_id])
      @contexts = Context.ordered
      flash[:notice] = 'Task was successfully updated.'
    else
      flash[:error] = @task.errors.full_messages.join
    end
  end

end