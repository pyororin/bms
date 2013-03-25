class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  def production?
    p ENV['RAILS_ENV']
    ENV['RAILS_ENV'] == 'production'
  end
end
