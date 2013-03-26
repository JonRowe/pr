module PR
  module Fields
    class GenericField

      def initialize value = nil
        @value = value
      end

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
