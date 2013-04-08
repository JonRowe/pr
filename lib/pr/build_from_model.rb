module PR
  class BuildFromModel

    def self.[] klass, model
      new(PR::FieldRegistry[klass], klass.new).build_from model
    end

    def initialize registry, form
      @registry, @form = registry, form
    end

    def build_from model
      @registry.fields.each do |field|
        @form.send("__#{field}").populate model.send(field) if model.respond_to? field
      end
      @form
    end

  end
end
