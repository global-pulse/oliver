class CommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @data_source = DataSource.find(params[:data_source_id])
    p = params[:comment]
    p[:user] = current_user
    @comment = @data_source.comments.create!(params[:comment])
    redirect_to @data_source, :notice => "Comment Created"
  end
end
