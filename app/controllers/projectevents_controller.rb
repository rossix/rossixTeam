class ProjecteventsController < ApplicationController
  # GET /Projects
  # GET /Projects.json
  def index
    @projectevents = Projectevent.scoped
    @projectevents = Projectevent.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projectevents }
    end
  end

  # GET /Projects/1
  # GET /Projects/1.json
  def show
    @projectevent = Projectevent.find(params[:id])
    @project_id = @projectevent.project_id
    @project = Project.find(@project_id)
    redirect_to "/projects/#{@project_id}"
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render :json => @projectevent }
    #end
  end

  def showmilestone
      @projectevent = Projectevent.find(params[:id])
      @project_id = @projectevent.project_id
      @project = Project.find(@project_id)

      #respond_to do |format|
      #  format.html # show.html.erb
      #  format.json { render :json => @projectevent }
      #end
    end

  # GET /Projects/new
  # GET /Projects/new.json
  def new
    @projectevent = Projectevent.new
    @projectevent.project_id=params[:id]
    @projectevent.eventtype="milestone"
    @projectevent.color="orange"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @projectevent }
    end
  end

  # GET /Projects/1/edit
  def edit
    @projectevent = Projectevent.find(params[:id])
  end

  # POST /Projects
  # POST /Projects.json
  def create
    @projectevent = Projectevent.new(params[:projectevent])


    respond_to do |format|
      if @projectevent.save
        format.html { redirect_to @projectevent, :notice => 'Projectevent was successfully created.' }
        format.json { render :json => @projectevent, :status => :created, :location => @projectevent }
      else
        format.html { render :action => "new" }
        format.json { render :json => @projectevent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Projects/1
  # PUT /Projects/1.json
  def update
    @projectevent = Projectevent.find(params[:id])

    respond_to do |format|
      if @projectevent.update_attributes(params[:project])
        format.html { redirect_to @projectevent, :notice => 'Projectevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @projectevent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Projects/1
  # DELETE /Projects/1.json
  def destroy
    @projectevent = Projectevent.find(params[:id])
    @projectevent.destroy

    respond_to do |format|
      format.html { redirect_to projectevents_url }
      format.json { head :no_content }
    end
  end
end
