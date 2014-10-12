= AttrDefaults = 

Mixin to specify defaults for Ruby's `attr` methods. Note that this gem requires Ruby 2.0.0 or greater. 

``ruby
require 'attr_defaults'

class User
	include AttrDefaults
	attr_reader(:admin) { false }
	attr_accessor(:name) { 'Anonymous' }
end

user = User.new 
puts "#{user.name} #{user.admin ? 'is' : 'is not'} an administrator"
# => Anonymous is not an administrator