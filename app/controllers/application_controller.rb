class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @datasource_count = DataSource.count
    @dataset_count = DataSet.count
  end
end
