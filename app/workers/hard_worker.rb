class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    # do something
  end
end

# HardWorker.perform_async('bob', 5)
