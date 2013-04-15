module PR
  module Form

    def self.included other
      other.send :extend,  DSL
      other.send :include, Macros
    end

    module DSL
      def field name, type, options = {}
        PR::DefineAndRegister[ self, name, type, options ]
      end
      def from_hash hash, *args
        form = new *args
        PR::BuildFromHash[ form, hash ]
        form
      end
      def from_model model
        PR::BuildFromModel[ self, model ]
      end
    end

    module Macros
      def build_model model
        BuildModel[ self, model ]
      end
    end

  end
end
