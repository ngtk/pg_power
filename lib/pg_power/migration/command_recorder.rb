# Provides methods to extend ActiveRecord::Migration::CommandRecorder to
# support pg_power features.
module PgPower::Migration::CommandRecorder
  extend ActiveSupport::Autoload

  autoload :ExtensionMethods
  autoload :SchemaMethods
  autoload :CommentMethods
  autoload :ForeignerMethods
  autoload :FunctionMethods
  autoload :ViewMethods

  include ExtensionMethods
  include SchemaMethods
  include CommentMethods
  include ForeignerMethods
  include FunctionMethods
  include ViewMethods
end
