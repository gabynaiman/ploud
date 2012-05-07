module ActsAsAuditable

  module Model

    module ClassMethods
      def acts_as_auditable
        include InstanceMethods
        before_create :set_creator
        before_update :set_updater
      end

      def acts_as_audit_stamp
        cattr_accessor :current
        ActsAsAuditable.audit_class = self
      end
    end

    module InstanceMethods
      def creator
        ActsAsAuditable.audit_class.find(created_by) if !created_by.nil?
      end

      def updater
        ActsAsAuditable.audit_class.find(updated_by) if !updated_by.nil?
      end

      private

      def set_creator
        self.created_by = ActsAsAuditable.audit_class.current.id
        self.updated_by = ActsAsAuditable.audit_class.current.id
      end

      def set_updater
        self.updated_by = ActsAsAuditable.audit_class.current.id
      end
    end

  end

end



