class PlatformsController < ApplicationController

  # GET /platform
  # GET /platform.xml
  def index
    @platforms = Platform.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @platform }
    end
  end

  # GET /platform/1
  # GET /platform/1.xml
  def show
    @platform = Platform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @platform }
    end
  end

  # GET /platform/new
  # GET /platform/new.xml
  def new
    @platform = Platform.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @platform }
    end
  end

  # GET /platform/1/edit
  def edit
    @platform = Platform.find(params[:id])
  end

  # POST /platform
  # POST /platform.xml
  def create
    @platform = Platform.new(params[:platform])

    respond_to do |format|
      if @platform.save
        format.html { redirect_to(@platform, :notice => 'Data source was successfully created.') }
        format.xml  { render :xml => @platform, :status => :created, :location => @platform }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @platform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /platform/1
  # PUT /platform/1.xml
  def update
    @platform = Platform.find(params[:id])

    respond_to do |format|
      if @platform.update_attributes(params[:platform])
        format.html { redirect_to(@platform, :notice => 'Data source was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @platform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /platform/1
  # DELETE /platform/1.xml
  def destroy
    @platform = Platform.find(params[:id])
    @platform.destroy

    respond_to do |format|
      format.html { redirect_to(platform_url) }
      format.xml  { head :ok }
    end
  end
end
