module PR
  module Fields
    class BooleanField
      TrueValues  = [1,"1","true",true]
      FalseValues = [0,"0","false",false, ""]

      def initialize value = nil
        @value = value
      end

      def populate value
        @value = value
      end

      def raw
        convert
      end

      def convert
        if TrueValues.include? @value
          return true
        elsif FalseValues.include? @value
          return false
        else
          @value ? true : false
        end
      end

    end
  end
end
