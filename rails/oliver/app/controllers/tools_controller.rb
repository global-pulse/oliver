class ToolsController < ApplicationController

  # GET /tool
  # GET /tool.xml
  def index
    @tool = Tool.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tool }
    end
  end

  # GET /tool/1
  # GET /tool/1.xml
  def show
    @tool = Tool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tool }
    end
  end

  # GET /tool/new
  # GET /tool/new.xml
  def new
    @tool = Tool.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tool }
    end
  end

  # GET /tool/1/edit
  def edit
    @tool = Tool.find(params[:id])
  end

  # POST /tool
  # POST /tool.xml
  def create
    @tool = Tool.new(params[:tool])

    respond_to do |format|
      if @tool.save
        format.html { redirect_to(@tool, :notice => 'Tool entry was successfully created.') }
        format.xml  { render :xml => @tool, :status => :created, :location => @tool }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tool/1
  # PUT /tool/1.xml
  def update
    @tool = Tool.find(params[:id])

    respond_to do |format|
      if @tool.update_attributes(params[:tool])
        format.html { redirect_to(@tool, :notice => 'Tool entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tool/1
  # DELETE /tool/1.xml
  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy

    respond_to do |format|
      format.html { redirect_to(tool_url) }
      format.xml  { head :ok }
    end
  end
end
