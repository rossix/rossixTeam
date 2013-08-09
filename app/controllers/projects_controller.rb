class ProjectsController < ApplicationController

  def search
      @projectsearch = params[:title]
      redirect_to :action => 'index', :title => @projectsearch
    end
  # GET /projects
  # GET /projects.json
  def index
    if params[:title] != nil then
    @projectsearch = params[:title]+"%"
    else
      @projectsearch ="%"
    end

    @projects = Project.all(:conditions => ["team_id = #{current_user.team_id} and title like ?","#{@projectsearch}"])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end


  def my_projects
    @projects = Project.all(:conditions => ["user_id = #{current_user.id}"])
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

  def copy
    @source_project = Project.find(params[:id])
    @milestones = Projectevent.all(:conditions => ["project_id = ?",@source_project.id])
    @todos = Todo.all(:conditions => ["project_id = ?",@source_project.id])
    @dest_project = Project.new
    @dest_project.title = "Copy of" + @source_project.title
    @dest_project.description = "copy of " + @source_project.description
    @dest_project.starts_at = @source_project.starts_at
    @dest_project.ends_at = @source_project.ends_at
    @dest_project.user_id = current_user.id
    @dest_project.team_id = current_user.id
    @dest_project.save
    @project_id = @dest_project.id
    @milestones.each do |milestone|
      @milestone = Projectevent.new
      @milestone.title = milestone.title
      @milestone.starts_at = milestone.starts_at
      @milestone.ends_at = milestone.ends_at
      @milestone.description = milestone.description
      @milestone.eventtype = milestone.eventtype
      @milestone.user_id = milestone.user_id
      @milestone.team_id = milestone.team_id
      @milestone.color = milestone.color
      @milestone.project_id = @project_id
      @milestone.save
    end

    @todos.each do |todo|
          @todo = Todo.new
          @todo.todotitle = todo.todotitle
          @todo.description = todo.description
          @todo.user_id = todo.user_id
          @todo.team_id = todo.team_id
          @todo.project_id = @project_id
          @todo.position = todo.position
          @todo.save
    end
    redirect_to @dest_project
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

  def report

    @project = Project.find(params[:id])
           id=params[:id]
           user= User.find(@project.user_id)
           @username = user.firstname  + " " +user.name
           @projectevents = Projectevent.find_all_by_eventtype_and_project_id("milestone",id)

          @todos = Todo.order("position").find_all_by_project_id(id)
     #@project="Hallo"
          pdf=ProjectPdf.new(@project, @projectevents, @todos, @username)
          send_data pdf.report, :filename => "Projectreport ",
                    :type => "application/pdf",
                    :disposition => "inline"


  end
end

