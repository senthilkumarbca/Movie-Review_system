class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    movies_path
  end
end
