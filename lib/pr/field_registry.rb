module PR
  class FieldRegistry

    def self.[] klass
      @registers ||= {}
      @registers[klass] ||= new(klass)
    end

    def initialize klass
      @for = klass
      @fields = {}
    end
    attr_reader :for

    def register field_name, field
      @fields[field_name] = field
    end

    def fetch field_name
      @fields.fetch field_name
    end

    def fields
      @fields.keys
    end


  end
end
