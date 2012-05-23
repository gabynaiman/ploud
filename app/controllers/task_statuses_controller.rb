class TaskStatusesController < ApplicationController
  before_filter :load_workspace

  def index
    @task_statuses = @workspace.task_statuses.search(params[:query]).result.ordered.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_statuses }
    end
  end

  def show
    @task_status = TaskStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_status }
    end
  end

  def new
    @task_status = @workspace.task_statuses.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_status }
    end
  end

  def edit
    @task_status = TaskStatus.find(params[:id])
  end

  def create
    @task_status = @workspace.task_statuses.build

    respond_to do |format|
      if @task_status.update_attributes(params[:task_status])
        format.html { redirect_to [@workspace.context, @workspace, @task_status], notice: 'Task status was successfully created.' }
        format.json { render json: @task_status, status: :created, location: @task_status }
      else
        format.html { render action: "new" }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task_status = TaskStatus.find(params[:id])

    respond_to do |format|
      if @task_status.update_attributes(params[:task_status])
        format.html { redirect_to [@workspace.context, @workspace, @task_status], notice: 'Task status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_status = TaskStatus.find(params[:id])
    @task_status.destroy

    respond_to do |format|
      format.html { redirect_to context_workspace_task_statuses_url(@workspace.context, @workspace) }
      format.json { head :no_content }
    end
  end

  private

  def load_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end
end
