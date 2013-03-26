module PR
  module Fields
    class StringField

      def initialize value = ''
        @value = value
      end

      def raw
        @value
      end

      def populate value
        @value = value
      end

      def convert
        @value.to_s
      end

    end
  end
end
