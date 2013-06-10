class FacilityGateway < IntersystemsGateway::Base
  set_table_name "INSTITUTION"
  set_fields name: "NAME", city: "CITY", state: "STATE", zipcode: { name: "ZIP", to_save: to_string_converter, to_retrieve: to_integer_converter }, street: "STREET_ADDR__1"
end
