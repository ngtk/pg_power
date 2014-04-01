# Provides methods to extend {ActiveRecord::SchemaDumper} to appropriately
# build schema.rb file with schemas, foreign keys and comments on columns
# and tables.
module PgPower::SchemaDumper
  extend ActiveSupport::Autoload
  extend ActiveSupport::Concern

  autoload :ExtensionMethods
  autoload :CommentMethods
  autoload :SchemaMethods
  autoload :ForeignerMethods
  autoload :FunctionMethods
  autoload :ViewMethods

  include ExtensionMethods
  include CommentMethods
  include SchemaMethods
  include ForeignerMethods
  include FunctionMethods
  include ViewMethods

  included do
    alias_method_chain :header, :schemas
    alias_method_chain :header, :extensions

    alias_method_chain :tables, :schemas
    alias_method_chain :tables, :functions
    alias_method_chain :tables, :views
    alias_method_chain :tables, :comments
    alias_method_chain :tables, :foreign_keys
  end
end
