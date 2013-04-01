module PR
  class FieldRegistry

    def self.[] klass
      @registers ||= {}
      @registers[klass] ||= new(klass)
    end

    def initialize klass
      @for = klass
    end
    attr_reader :for

  end
end
