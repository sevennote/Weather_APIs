class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  require 'forecast_io'

  require 'typhoeus/adapters/faraday'

  require 'net/http'

  require 'open-uri'

  require 'json'

  




end
