class NumbersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    ActionCable.server.broadcast "number_channel", is_prime: args[0], item: args[1]
  end
end
