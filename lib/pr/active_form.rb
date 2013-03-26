require 'active_model'
require 'pr/form'

module PR
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

    def to_model
      self
    end

    def persisted?
      !(id.nil?)
    end

    def to_key
      [:id] if persisted?
    end

    def to_param
      id.to_s if persisted?
    end

  end
end
