require 'clockwork'
require './config/boot'
require './config/environment'

Rails.application.eager_load! unless Rails.env.test?

module Clockwork
  configure do |config|
    config[:sleep_timeout] = 5
    config[:max_threads] = 15
    config[:thread] = true
  end

  every(1.day, 'RecordActivity', at: '09:00') do
    RecordActivityJob.process
  end

  every(1.day, 'GenerateRecipe', at: '23:00') do
    GenerateRecipe.process
  end
end
