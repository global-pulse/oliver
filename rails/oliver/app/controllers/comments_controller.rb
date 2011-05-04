class CommentsController < ApplicationController
  def create
    @data_source = DataSource.find(params[:data_source_id])
    @comment = @data_source.comments.create!(params[:comment])
    redirect_to @data_source, :notice => "Comment Created"
  end
end
