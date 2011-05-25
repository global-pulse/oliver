class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @dataset_count = DataSource.count
  end
end
