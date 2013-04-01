module PR
  class DefineAndRegister

    class << self
      def [] klass, name, type, options = {}
        new(klass).define_and_register name, type, options
      end
    end

    def initialize klass
      @registry = FieldRegistry[klass]
      @klass = klass
    end

    def define_and_register name, type, options
      register name, define(name,type,options)
    end

    def register name, field
      @registry.register name, field
    end

    def define name, type, options = {}
      DefineField[ @klass, name, Fields[type], options ]
    end

  end
end
