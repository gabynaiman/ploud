module ActsAsAuditable

  module Controller

    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
      base.before_filter :set_audit
      base.after_filter :reset_audit
    end

    module InstanceMethods
      private
      def set_audit
        ActsAsAuditable.audit_class.current = eval("current_#{ActsAsAuditable.audit_class.model_name.underscore}")
      end

      def reset_audit
        ActsAsAuditable.audit_class.current = nil
      end
    end

  end

end