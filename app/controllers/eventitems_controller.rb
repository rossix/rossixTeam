class EventitemsController < ApplicationController
  # GET /eventitems
  # GET /eventitems.json
  def index
    @eventitems = Eventitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @eventitems }
    end
  end

  # GET /eventitems/1
  # GET /eventitems/1.json
  def show
    @eventitem = Eventitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @eventitem }
    end
  end

  # GET /eventitems/new
  # GET /eventitems/new.json
  def new
    @eventitem = Eventitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @eventitem }
    end
  end

  # GET /eventitems/1/edit
  def edit
    @eventitem = Eventitem.find(params[:id])
  end

  # POST /eventitems
  # POST /eventitems.json
  def create
    @eventitem = Eventitem.new(params[:eventitem])

    respond_to do |format|
      if @eventitem.save
        format.html { redirect_to @eventitem, :notice => 'Eventitem was successfully created.' }
        format.json { render :json => @eventitem, :status => :created, :location => @eventitem }
      else
        format.html { render :action => "new" }
        format.json { render :json => @eventitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eventitems/1
  # PUT /eventitems/1.json
  def update
    @eventitem = Eventitem.find(params[:id])

    respond_to do |format|
      if @eventitem.update_attributes(params[:eventitem])
        format.html { redirect_to @eventitem, :notice => 'Eventitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @eventitem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eventitems/1
  # DELETE /eventitems/1.json
  def destroy
    @eventitem = Eventitem.find(params[:id])
    @eventitem.destroy

    respond_to do |format|
      format.html { redirect_to eventitems_url }
      format.json { head :no_content }
    end
  end
end
