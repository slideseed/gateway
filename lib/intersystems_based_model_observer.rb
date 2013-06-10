class IntersystemsBasedModelObserver
  observes :holiday, :facility

  def after_create model
    IntersystemsGateway::Factory.gen_gateway(model).create! model
  end

  def after_update model
    IntersystemsGateway::Factory.gen_gateway(model).update! model
  end
end
