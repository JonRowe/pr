module PR
  module Form

    def self.included other
      other.send :extend, DSL
    end

    module DSL
      def field name, options = {}
        DefineAndRegister[ self, name, options ]
      end
    end

  end
end
