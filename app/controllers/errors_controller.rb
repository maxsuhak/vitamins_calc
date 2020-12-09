class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  def error404
    @not_found_path = params[:not_found]
  end
end
