require "PR/version"

module PR
end

require 'pr/fields'
require 'pr/form'
require 'pr/active_form' if defined?(Rails)
