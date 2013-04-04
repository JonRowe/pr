require "pr/version"

module PR
end

require 'pr/fields'

#how we define fields
require 'pr/field_registry'
require 'pr/define_field'
require 'pr/define_and_register'

require 'pr/build_model'

require 'pr/form'
require 'pr/active_form' if defined?(Rails)
