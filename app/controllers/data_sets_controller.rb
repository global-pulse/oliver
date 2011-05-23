class DataSetsController < ApplicationController
  def index
    @data_source = DataSource.find(params[:data_source_id])
    @data_sets   = DataSet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @data_sets }
    end
  end

  def show
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = DataSet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @data_set }
    end
  end

  def new
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = DataSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @data_set }
    end
  end

  def edit
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = DataSet.find(params[:id])
  end

  def refresh_and_transform_data
    if @data_set.uri
      @data_set.refresh_data(HostAdaptor.new)
      @data_set.transform(@data_set.transform_script)
    end
  end

  def create
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = @data_source.data_sets.create!(params[:data_set])

    refresh_and_transform_data()

    respond_to do |format|
      if @data_set.save
        format.html { redirect_to(data_source_data_set_path(@data_source, @data_set), :notice => 'Data set was successfully created.') }
        format.xml { render :xml => @data_set, :status => :created, :location => @data_set }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  def pull
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = DataSet.new(params[:data_set])

    respond_to do |format|
      if @data_set.update_attributes(params[:data_set])
        format.html { redirect_to(data_source_data_set_path(@data_source.to_param, @data_set.to_param), :notice => 'Data set was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = DataSet.find(params[:id])

    respond_to do |format|
      if @data_set.update_attributes(params[:data_set])

        refresh_and_transform_data()

        @data_set.save

        format.html { redirect_to(data_source_data_set_path(@data_source, @data_set), :notice => 'Data set was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @data_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @data_source = DataSource.find(params[:data_source_id])
    @data_set    = DataSet.find(params[:id])
    @data_set.destroy

    respond_to do |format|
      format.html { redirect_to(data_source_data_sets_url(@data_source)) }
      format.xml { head :ok }
    end
  end
end
