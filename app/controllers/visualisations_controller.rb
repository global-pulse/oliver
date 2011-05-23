class VisualisationsController < ApplicationController
  # GET /visualisations
  # GET /visualisations.xml
  def index
    @visualisations = Visualisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visualisations }
    end
  end

  # GET /visualisations/1
  # GET /visualisations/1.xml
  def show
    @visualisation = Visualisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visualisation }
    end
  end

  # GET /visualisations/new
  # GET /visualisations/new.xml
  def new
    @visualisation = Visualisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visualisation }
    end
  end

  # GET /visualisations/1/edit
  def edit
    @visualisation = Visualisation.find(params[:id])
  end

  # POST /visualisations
  # POST /visualisations.xml
  def create
    @visualisation = Visualisation.new(params[:visualisation])

    respond_to do |format|
      if @visualisation.save
        format.html { redirect_to(@visualisation, :notice => 'Visualisation was successfully created.') }
        format.xml  { render :xml => @visualisation, :status => :created, :location => @visualisation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visualisation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visualisations/1
  # PUT /visualisations/1.xml
  def update
    @visualisation = Visualisation.find(params[:id])

    respond_to do |format|
      if @visualisation.update_attributes(params[:visualisation])
        format.html { redirect_to(@visualisation, :notice => 'Visualisation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visualisation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visualisations/1
  # DELETE /visualisations/1.xml
  def destroy
    @visualisation = Visualisation.find(params[:id])
    @visualisation.destroy

    respond_to do |format|
      format.html { redirect_to(visualisations_url) }
      format.xml  { head :ok }
    end
  end
end
