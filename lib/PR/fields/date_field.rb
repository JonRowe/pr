require 'date'
module PR
  module Fields
    class DateField
      Format = '%d/%m/%Y'

      def initialize value = ''
        @value = value
      end

      def raw
        @value
      end

      def populate date
        @value = date.strftime Format
      end

      def convert
        Date.strptime(@value,Format)
      rescue ArgumentError
        raise InvalidValue
      end

    end
  end
end
