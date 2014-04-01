# Extends ActiveRecord::SchemaDumper class to dump views
module PgPower::SchemaDumper::FunctionMethods
  # Dump create view statements
  def tables_with_functions(stream)
    tables_without_functions(stream)
    functions(stream)
    stream
  end

  # Generates code to create views.
  def functions(stream)
    # Don't create "system" views.
    function_names = PgPower::Tools.functions
    function_names.each do |options|
      write_function_definition(stream,
                            options["proname"],
                            options["prosrc"].gsub(/\\/) { |src| "\\#{src}" },
                            options["nspname"],
                            options["pg_get_function_arguments"],
                            options["pg_get_function_result"]


      )
    end
    stream << "\n"
  end

  # Generates code to create view.
  def write_function_definition(stream, function_name, function_body, schema, arguments, result)
      stream << "  create_function \"#{schema}.#{function_name}\", \"#{arguments}\" , \"#{result}\" , <<-SQL\n" \
              "    #{function_body}" \
              " \nSQL\n"

  end
  private :write_function_definition

end
