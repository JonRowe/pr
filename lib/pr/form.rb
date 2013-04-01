module PR
  module Form

    def self.included other
      other.send :extend, DSL
    end

    module DSL
      def field name, type, options = {}
        PR::DefineAndRegister[ self, name, type, options ]
      end
    end

  end
end
