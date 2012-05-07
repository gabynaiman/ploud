module AuditStamp

  module MgrationHelper

    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def auditstamps
        column('created_by', :integer, :null => false)
        column('updated_by', :integer, :null => false)
      end
    end

  end

end

