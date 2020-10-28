class MeasurementsJob < ApplicationJob
  queue_as :quick

  def perform
    RabbitmqBus.send_to_bus('metrics', "group count=#{Group.count}")
    RabbitmqBus.send_to_bus('metrics', "user in_beta=#{User.in_beta.count},count=#{User.count}")
  end
end
