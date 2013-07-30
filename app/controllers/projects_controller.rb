class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all(:conditions => "team_id = #{current_user.team_id}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
        id=params[:id]
            @projectevents = Projectevent.find_all_by_eventtype_and_project_id("milestone",id)
            @todos = Todo.order("position").find_all_by_project_id(id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project }
    end
  end

  def add_milestone
           projectid=params[:project]
           redirect_to "/projectevents/new/#{projectid}"

  end




  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    id=params[:id]
    @projectevents = Projectevent.find_all_by_eventtype_and_project_id("milestone",id)
    @todos = Todo.find_all_by_project_id(id)

    respond_to do |format|
          format.html # show.html.erb
          format.json { render :json => @project }
    end

  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @team_id = current_user.team_id
    @project.all_day = "true"
    @project.team_id = @team_id
    @state = params[:project][:state]

    if @state == "offen"
                  @project.color =="darkblue"
                elsif @state =="aktiv"
                  @project.color = "darkgreen"
                elsif @state =="in Arbeit"
                     @project.color = "orange"
                elsif @state =="kritisch"
                     @project.color = "darkred"
                elsif @state =="fertig"
                     @project.color = "darkgrey"
                end

    @projectevent = Projectevent.new(params[:project])

    respond_to do |format|
      if @project.save


        @project.save
        @projectevent.project_id = @project.id
        @projectevent.team_id = @team_id
        @projectevent.eventtype = "project"
        #@projectevent.color= "darkgrey"
        @projectevent.all_day = "true"
        @projectevent.color = @project.color
         @projectevent.save
        format.html { redirect_to @project, :notice => 'Project was successfully created.' }
        format.json { render :json => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    id = params[:id]
    @state = params[:project][:state]

        if @state == "offen"
                      @project.color =="darkblue"
                    elsif @state =="aktiv"
                      @project.color = "darkgreen"
                    elsif @state =="in Arbeit"
                         @project.color = "orange"
                    elsif @state =="kritisch"
                         @project.color = "darkred"
                    elsif @state =="fertig"
                         @project.color = "darkgrey"
                    end


    @projectevent = Projectevent.find_by_eventtype_and_project_id("project" , id)

    respond_to do |format|
      if @project.update_attributes(params[:project])

        @projectevent.update_attributes(params[:project])
        @projectevent.color = @project.color
        @projectevent.save

        format.html { redirect_to @project, :notice => 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def sort
    index=1
    params[:todo].each do |id|
       @todo = Todo.find_by_id(id)
        @todo.position = index
       @todo.save
       index=index+1
      end
     render :nothing => true
   end
end
