class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index

    #team = current_user.team_id
    @events = Event.scoped(:conditions => "team_id = #{current_user.team_id}") and Event.between(params['start'], params['end']) if (params['start'] && params['end'])
    #@events = Event.between(params['start'], params['end']) if (params['start'] && params['end'])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    @title_new = @event.eventitem.item+@event.user.firstname
    @colornew = @event.eventitem.color
    @team_id = current_user.team_id


    respond_to do |format|
      if @event.save
        @event.update_attributes(:title => @title_new, :color => @colornew, :team_id => @team_id)


        format.html { redirect_to @event, :notice => 'Event was successfully created.' }
        format.json { render :json => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    @item_new= Eventitem.first(params[:eventitem_id])
    @user_new= User.first(params[:user_id])

    @title_new = @event.eventitem.item+@event.user.firstname
    @color_new = @event.eventitem.color
    respond_to do |format|
      if @event.update_attributes(params[:event])
        @item_new= Eventitem.first(params[:eventitem_id])
        @user_new= User.first(params[:user_id])
        @title_new = @event.eventitem.item+@event.user.firstname
        @color_new = @event.eventitem.color
        @event.update_attributes(:title => @title_new, :color =>@color_new)
        @event_check_enddate = Event.find(params[:id]).ends_at
        if  @event_check_enddate == nil
          @event.update_attributes(:ends_at => @event.starts_at)
        end
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to "/calendar" }
      format.json { head :no_content }
    end
  end
end

