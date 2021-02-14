class NumberChannel < ApplicationCable::Channel
  def subscribed
    stream_from "number_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
