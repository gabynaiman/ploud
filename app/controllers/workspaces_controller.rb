class WorkspacesController < ApplicationController
  before_filter :load_context

  def index
    @workspaces = @context.workspaces.search(params[:query]).result.ordered.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workspaces }
    end
  end

  def show
    @workspace = Workspace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workspace }
    end
  end

  def new
    @workspace = Workspace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workspace }
    end
  end

  def edit
    @workspace = Workspace.find(params[:id])
  end

  def create
    @workspace = Workspace.new(params[:workspace])
    @workspace.context = @context

    respond_to do |format|
      if @workspace.save
        format.html { redirect_to [@context, @workspace], notice: 'Workspace was successfully created.' }
        format.json { render json: @workspace, status: :created, location: @workspace }
      else
        format.html { render action: "new" }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @workspace = Workspace.find(params[:id])

    respond_to do |format|
      if @workspace.update_attributes(params[:workspace])
        format.html { redirect_to [@context, @workspace], notice: 'Workspace was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workspace = Workspace.find(params[:id])
    @workspace.destroy

    respond_to do |format|
      format.html { redirect_to context_workspaces_url(@context) }
      format.json { head :no_content }
    end
  end

  private

  def load_context
    @context = Context.find(params[:context_id])
  end

end
