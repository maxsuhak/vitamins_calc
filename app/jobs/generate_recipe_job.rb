class GenerateRecipeJob < ApplicationJob
  queue_as :default

  rescue_from(StandardError) do |exception|
    Rails.logger.error(exception)
  end

  def perform
    # TODO: autogenerate receipe for each user
  end
end
