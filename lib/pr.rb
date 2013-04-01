require "pr/version"

module PR
end

require 'pr/fields'
require 'pr/define_field'
require 'pr/define_and_register'
require 'pr/form'
require 'pr/active_form' if defined?(Rails)
