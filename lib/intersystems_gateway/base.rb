module IntersystemsGateway
  class Base
    extend FieldHelper
    include Actions

    def model_class
      self.class.model_class
    end
  end
end
