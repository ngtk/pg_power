module PgPower::Migration::CommandRecorder
  extend ActiveSupport::Autoload

  autoload :SchemaMethods
  autoload :CommentMethods
  autoload :ForeignerMethods

  include SchemaMethods
  include CommentMethods
  include ForeignerMethods
end
