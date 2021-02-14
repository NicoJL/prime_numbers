class NumbersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ActionCable.server.broadcast "number_channel", item: args[0]
  end
end
