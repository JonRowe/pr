module PR
  module Fields
    class FloatField

      def initialize value = ''
        @value = value
      end

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
