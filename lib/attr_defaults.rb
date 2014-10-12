module AttrDefaults
	module Initialize
		def initialize 
			defaults = class << self.class
				@attr_defaults
			end			
			
			unless defaults.nil?
				defaults.each do |attrs,default|
					attrs.each do |attr|
						instance_variable_set :"@#{attr}", default.call
					end
				end
			end
		end
	end

	module_function

	def included klass
		klass.prepend Initialize
		
		class << klass
			[:attr, :attr_writer, :attr_reader, :attr_accessor].each do |method|
				define_method method do |*attrs, &block|
					super *attrs
				
					unless block.nil?
						defaults = class << self
							@attr_defaults ||= {}
						end
				
						defaults[attrs] = block
					end
				end
			end
		end
	end
end