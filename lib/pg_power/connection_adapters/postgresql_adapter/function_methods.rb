# Provides methods to extend {ActiveRecord::ConnectionAdapters::PostgreSQLAdapter}
# to support functions feature.
module PgPower::ConnectionAdapters::PostgreSQLAdapter::FunctionMethods
  # Creates new function in DB.
  # @param [String, Symbol] function_name
  # @param [String] function_definition
  def create_function(function_name, function_arguments, function_result, function_definition)
    ::PgPower::Tools.create_function(function_name, function_arguments, function_result, function_definition)
  end

  # Drops function in DB.
  # @param [String, Symbol] function_name
  def drop_function(function_name)
    ::PgPower::Tools.drop_function(function_name)
  end

end
