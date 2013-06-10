module IntersystemsGateway
  module Factory
    def self.gen_gateway model
      gateway_for_model_class model.class
    end

    def self.gen_gateway_for_class clazz
      "#{clazz.to_s}Gateway".constantize
    end
  end
end
