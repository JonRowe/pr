module PR
  module Fields
    class GenericField

      def initialize value = nil, options = {}
        @value, @options = value, options
      end
      attr_reader :options

      def raw
        @value
      end

      def populate value
        @value = value
      end

      def convert
        @value
      end

    end
  end
end
