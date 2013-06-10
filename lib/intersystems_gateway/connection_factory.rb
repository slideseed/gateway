module IntersystemsGateway
  module ConnectionFactory # when on the jvm...
    load "cachejdbc.jar"
    java_import com.intersys.jdbc.CacheDataSource

    def self.get_connection
      data_source = CacheDataSource.new
      data_source.setURL(CACHE_URL) # jdbc://127.0.0.1:1972/CPM
      data_source.setUser(CACHE_USER) # jdbcuser
      data_source.setPassword(CACHE_PASSWORD) # jdbc123
      data_source.get_connection
    end
  end
end
