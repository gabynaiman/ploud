class TasksController < ApplicationController
  before_filter :load_workspace

  def index
    @tasks = @workspace.tasks.search(params[:query]).result.priorized.due_dates.ordered.page(params[:page])
  end

  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = @workspace.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@workspace.context, @workspace, @task], notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to [@task.workspace.context, @task.workspace, @task], notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @tasks = nil

    if @task.destroy
      @tasks = @workspace.tasks.search(params[:query]).result.priorized.ordered.page(params[:page])
      flash[:notice] = 'Task was successfully deleted.'
    else
      flash[:error] = 'Task cant be deleted.'
    end

    render 'index'
  end

  def update_status
    update_attribute(:task_status_id)
  end

  def update_priority
    update_attribute(:priority)
  end

  private

  def update_attribute(attribute)
    @task = Task.find(params[:id])
    @tasks = nil

    if @task.update_attribute(attribute, params[attribute])
      @tasks = @workspace.tasks.search(params[:query]).result.priorized.ordered.page(params[:page])
      flash[:notice] = 'Task was successfully updated.'
    else
      flash[:error] = @task.errors.full_messages.join
    end

    render 'index'
  end

  def load_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

end
