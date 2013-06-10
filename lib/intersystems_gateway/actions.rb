module IntersystemsGateway
  module Actions
    def create! model
      execute_for_connection do |connection|
        keys = fields.keys
        column_names = fields.values.map{|info|info[:name]}.join ","

        question_marks = ("?," * keys.count).chomp
        sql = "insert into #{qualified_table_name} (#{column_names}) VALUES #{question_marks}"
        statement = connection.prepare_statement sql
        fields.values.each_with_index do |info, index|
          statement.setString index+1, model[keys[index]]
        end
        statement.executeUpdate
      end
    end

    def execute_for_connection
      connection = ConnectionFactory.get_connection
      yield connection
      connection.close
    end

    def delete! id
      execute_for_connection do |connection|
        statement = connection.prepare_statement "delete from #{qualified_table_name} where RowID = #{id}"
        statement.execute
      end
    end

    def update! model
      # inefficient but works
      delete! model.id
      create! model
    end
  end
end
