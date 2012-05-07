module AuditStamp

  module ControllerHelper

    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
      base.around_filter :with_audit
    end

    module InstanceMethods
      private
      def with_audit
        AuditStamp.audit_class.current = eval("current_#{AuditStamp.audit_model}")
        yield
        AuditStamp.audit_class.current = nil
      end
    end

  end

end