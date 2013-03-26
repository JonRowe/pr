class BuildModel
  def self.[] form, model
    new(PR::FieldRegistry).for form, model
  end

  def initialize registry
    @registry = registry
  end

  def for form, model
    @registry.fields_for(form) do |field_name|
      set model, field_name, value(form,field_name)
    end
  end

  private
    def set thing, name, value
      thing.send "#{name}=", value
    end
    def value thing, name
      thing.send("__#{name}").convert
    end

end
