require "pr/version"

module PR
end

require 'pr/fields'
require 'pr/define_field'
require 'pr/form'
require 'pr/active_form' if defined?(Rails)
