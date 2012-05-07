class TaskStatusesController < ApplicationController
  before_filter :load_context

  # GET /task_statuses
  # GET /task_statuses.json
  def index
    @task_statuses = TaskStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_statuses }
    end
  end

  # GET /task_statuses/1
  # GET /task_statuses/1.json
  def show
    @task_status = TaskStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_status }
    end
  end

  # GET /task_statuses/new
  # GET /task_statuses/new.json
  def new
    @task_status = TaskStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_status }
    end
  end

  # GET /task_statuses/1/edit
  def edit
    @task_status = TaskStatus.find(params[:id])
  end

  # POST /task_statuses
  # POST /task_statuses.json
  def create
    @task_status = TaskStatus.new(params[:task_status])
    @task_status.context = @context

    respond_to do |format|
      if @task_status.save
        format.html { redirect_to [@context.project, @context, @task_status], notice: 'Task status was successfully created.' }
        format.json { render json: @task_status, status: :created, location: @task_status }
      else
        format.html { render action: "new" }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /task_statuses/1
  # PUT /task_statuses/1.json
  def update
    @task_status = TaskStatus.find(params[:id])

    respond_to do |format|
      if @task_status.update_attributes(params[:task_status])
        format.html { redirect_to [@context.project, @context, @task_status], notice: 'Task status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_statuses/1
  # DELETE /task_statuses/1.json
  def destroy
    @task_status = TaskStatus.find(params[:id])
    @task_status.destroy

    respond_to do |format|
      format.html { redirect_to project_context_task_statuses_url(@context.project, @context) }
      format.json { head :no_content }
    end
  end

  private

  def load_context
    @context = Context.find(params[:context_id])
  end
end
