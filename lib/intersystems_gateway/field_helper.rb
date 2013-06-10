module IntersystemsGateway
  module FieldHelper
    def pull_field_details field_info
      if field_info.is_a? String
        field_info = {name: field_info}
      end
      field_info.tap do |info|
        field_info[:to_save] ||= identity
        field_info[:to_retrieve] ||= identity
      end
    end

    def wrap_fields fields
      {}.tap do |wrapped|
        fields.each_pair do |field_name, details|
          wrapped[field_name] = pull_field_details(details)
        end
      end
    end

    def set_fields fields
      @fields = {id: {
        name: "RowID",
        to_save: to_string_converter,
        to_retrieve: to_integer_converter
      }}.merge wrap_fields(fields)
    end

    def set_table_name name
      @table_name = name
    end

    def table_name
      @table_name || gen_table_name
    end

    def qualified_table_name
      "vhaino.#{qualified_table_name}"
    end

    def gen_table_name
      to_s.sub(/Gateway/, '').upcase
    end

    def model_class
      to_s.sub(/Gateway/, '').constantize
    end

    def pull_attr_hash model
      {}.tap do |hash|
        @fields.each_pair do |key, info|
          hash[info][:name] = to_save(hash[key])
        end
      end
    end
  end
end
