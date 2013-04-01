require 'pr/fields/invalid_value'
require 'pr/fields/generic_field'
require 'pr/fields/string_field'
require 'pr/fields/boolean_field'
require 'pr/fields/date_field'
require 'pr/fields/float_field'

module PR
  module Fields

    PreDefined =
      {
        generic: GenericField,
        string:  StringField,
        boolean: BooleanField,
        date:    DateField,
        float:   FloatField
      }

    class << self

      def [] name
        __fields[name]
      end

      def []= custom_name, field
        __fields[custom_name] = field
      end

      def __fields
        @__fields ||= PreDefined.dup
      end
      private :__fields

    end
  end
end
