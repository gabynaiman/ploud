module AuditStamp

  module ModelHelper

    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
      base.before_create :set_creator
      base.before_update :set_updater
    end

    module InstanceMethods
      def creator
        AuditStamp.audit_class.find(created_by) if respond_to? :created_by
      end

      def updater
        AuditStamp.audit_class.find(updated_by) if respond_to? :updated_by
      end

      private

      def set_creator
        self.created_by = AuditStamp.audit_class.current.id if respond_to? :created_by
        self.updated_by = AuditStamp.audit_class.current.id if respond_to? :updated_by
      end

      def set_updater
        self.updated_by = AuditStamp.audit_class.current.id if respond_to? :updated_by
      end
    end

  end

end