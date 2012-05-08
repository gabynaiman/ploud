class TasksController < ApplicationController
  before_filter :load_context

  def index
    @tasks = @context.tasks.search(params[:query]).result.ordered.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
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
    @task = Task.new(params[:task])
    @task.context = @context

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@context.project, @context, @task], notice: 'Task was successfully created.' }
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
        format.html { redirect_to [@context.project, @context, @task], notice: 'Task was successfully updated.' }
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
      @tasks = @context.tasks.search(params[:query]).result.ordered.page(params[:page])
      flash[:notice] = 'Task was successfully deleted.'
    else
      flash[:error] = 'Task cant be deleted.'
    end
  end

  def update_status
    @task = Task.find(params[:id])
    @tasks = nil

    if @task.update_attribute(:task_status_id, params[:task_status_id])
      @tasks = @context.tasks.search(params[:query]).result.ordered.page(params[:page])
      flash[:notice] = 'Task was successfully updated.'
    else
      flash[:error] = @task.errors.full_messages.join
    end
  end

  private

  def load_context
    @context = Context.find(params[:context_id])
  end

end
