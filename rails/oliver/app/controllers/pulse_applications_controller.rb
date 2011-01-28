class PulseApplicationsController < ApplicationController

  before_filter :authenticate_user!

  # GET /pulse_applications
  # GET /pulse_applications.xml
  def index
    @pulse_applications = PulseApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pulse_applications }
    end
  end

  # GET /pulse_applications/1
  # GET /pulse_applications/1.xml
  def show
    @pulse_application = PulseApplication.find(params[:id])

#    @repository = github(@pulse_application.url)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pulse_application }
    end
  end

  # GET /pulse_applications/new
  # GET /pulse_applications/new.xml
  def new
    @pulse_application = PulseApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pulse_application }
    end
  end

  # GET /pulse_applications/1/edit
  def edit
    @pulse_application = PulseApplication.find(params[:id])
  end

  # POST /pulse_applications
  # POST /pulse_applications.xml
  def create
    @pulse_application = PulseApplication.new(params[:pulse_application])

    respond_to do |format|
      if @pulse_application.save
        format.html { redirect_to(@pulse_application, :notice => 'Pulse application was successfully created.') }
        format.xml  { render :xml => @pulse_application, :status => :created, :location => @pulse_application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pulse_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pulse_applications/1
  # PUT /pulse_applications/1.xml
  def update
    @pulse_application = PulseApplication.find(params[:id])

    respond_to do |format|
      if @pulse_application.update_attributes(params[:pulse_application])
        format.html { redirect_to(@pulse_application, :notice => 'Pulse application was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pulse_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pulse_applications/1
  # DELETE /pulse_applications/1.xml
  def destroy
    @pulse_application = PulseApplication.find(params[:id])
    @pulse_application.destroy

    respond_to do |format|
      format.html { redirect_to(pulse_applications_url) }
      format.xml  { head :ok }
    end
  end
end
