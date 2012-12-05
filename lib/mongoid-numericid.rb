require "mongoid-numericid/version"

module Mongoid
	module NumericID

		def self.included(base)
			base.send :include, InstanceMethods
			base.send :extend, ClassMethods
			base.before_create :generate_new_id
			base.send :field, :_numeric_id, :type => Fixnum
			base.send :index, {:_numeric_id => 1}, {:sparse => true}
		end

		module InstanceMethods
			def generate_new_id
				new_id = (self.class.last.try(:_numeric_id) || 0) + 1
				
				while !self.class.with_numeric_id(new_id).nil?
					new_id = (self.class.last.try(:_numeric_id) || 0) + 1
				end
				
				self._numeric_id = new_id
			end

			def numeric_id
				self._numeric_id
			end
		end # InstanceMethods

		module ClassMethods
			def with_numeric_id(id)
				return unscoped.any_in(:_numeric_id => id) if id.kind_of?(Array)
				return unscoped.where(:_numeric_id => id).first
			end

			def find(*args)
				rec = self.with_numeric_id(*args[0])
				return rec if rec
				super
			end
		end # ClassMethods

	end # NumericID
end # Mongoid
