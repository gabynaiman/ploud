require "#{Rails.root}/lib/audit_stamp/migration_helper"
require "#{Rails.root}/lib/audit_stamp/controller_helper"
require "#{Rails.root}/lib/audit_stamp/model_helper"

module AuditStamp

  mattr_accessor :audit_model
  @@audit_model = :user

  def self.audit_class
    audit_model.to_s.classify.constantize
  end

end

ActiveRecord::ConnectionAdapters::TableDefinition.send(:include, AuditStamp::MgrationHelper)

ActiveRecord::Base.send(:include, AuditStamp::ModelHelper)
AuditStamp.audit_class.cattr_accessor :current

ActionController::Base.send(:include, AuditStamp::ControllerHelper)



