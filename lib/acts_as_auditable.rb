require "#{Rails.root}/lib/acts_as_auditable/migration"
require "#{Rails.root}/lib/acts_as_auditable/controller"
require "#{Rails.root}/lib/acts_as_auditable/model"

module ActsAsAuditable
  mattr_accessor :audit_class
end

ActiveRecord::ConnectionAdapters::TableDefinition.send(:include, ActsAsAuditable::Mgration)
ActionController::Base.send(:include, ActsAsAuditable::Controller)

ActiveRecord::Base.class_eval do
  extend ActsAsAuditable::Model::ClassMethods
end