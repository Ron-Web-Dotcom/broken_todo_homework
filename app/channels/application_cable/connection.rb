#The Application Module Every WebSocket connection has a corresponding Connection object, which serves as parent to any Channel instance created off the connection
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  end
end
