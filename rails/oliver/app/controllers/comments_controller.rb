class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :update, :destroy]
  def create
    @data_source = DataSource.find(params[:data_source_id])
    p = params[:comment]
    p[:name] = current_user.email
    @comment = @data_source.comments.create!(params[:comment])
    redirect_to @data_source, :notice => "Comment Created"
  end
end
