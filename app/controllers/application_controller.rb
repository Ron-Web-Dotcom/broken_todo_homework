# Every WebSocket connection has a corresponding Connection object, which serves as parent to any Channel instance created off the connection
#in the class you have a clause with exception
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
