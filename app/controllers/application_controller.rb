class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  respond_to :html, :json
end
