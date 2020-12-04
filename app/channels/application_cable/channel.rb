#The Application Module Every WebSocket connection has a corresponding Connection object, which serves as parent to any Channel instance created off the connection

module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end
