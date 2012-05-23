class DraftsController < ApplicationController

  def index
    @tasks = Task.search(params[:query]).result.drafts_of(current_user).ordered

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def create
    @task = Task.new(params[:draft])
    @tasks = nil

    if @task.save
      @tasks = Task.drafts_of(current_user).ordered
      flash[:notice] = 'Task was successfully created.'
    else
      flash[:error] = @task.errors.full_messages.join
    end
  end

  def update
    @task = Task.find(params[:id])
    @tasks = nil

    if @task.update_attribute(:workspace_id, params[:workspace_id])
      @tasks = Task.drafts_of(current_user).ordered
      flash[:notice] = 'Task was successfully classified.'
    else
      flash[:error] = @task.errors.full_messages.join
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @tasks = nil

    if @task.destroy
      @tasks = Task.drafts_of(current_user).ordered
      flash[:notice] = 'Task was successfully deleted.'
    else
      flash[:error] = 'Task cant be deleted.'
    end
  end

end
