class RecordActivityJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do |exception|
    Rails.logger.error(exception)
  end

  def perform
    # TODO: send notification
  end
end
