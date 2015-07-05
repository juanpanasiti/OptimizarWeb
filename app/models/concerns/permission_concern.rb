module PermissionConcern
	extend ActiveSupport::Concern

	def is_common?
		self.permission_level >= 1
	end

	def is_editor?
		self.permission_level >= 2
	end

	def is_admin?
		self.permission_level >= 3
	end


#	module ClassMethods
#		
#	end
#	
#	module InstanceMethods
#		
#	end
#	
#	def self.included(receiver)
#		receiver.extend         ClassMethods
#		receiver.send :include, InstanceMethods
#	end
end