module PR
  module Fields
    class FloatField

      def initialize value = '', options = {}
        @value, @options = value, options
      end
      attr_reader :options

      def raw
        @value
      end

      def populate float
        @value = float.to_s
      end

      def convert
        Float @value
      rescue ArgumentError
        raise InvalidValue
      end

    end
  end
end
