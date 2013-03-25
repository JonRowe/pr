require 'active_model'
require 'pr/form'

module ActiveForm

  def self.included other
    other.send :include, Form
    other.send :include, ActiveModel::Validations
    other.send :attr_accessor, :id
    other.extend Compatibility
  end

  module Compatibility
    def model_name
      ActiveModel::Name.new self
    end
  end

end
