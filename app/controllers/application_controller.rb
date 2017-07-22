
class ApplicationController < ActionController::Base
  include YelpHelper

  protect_from_forgery with: :exception
end
