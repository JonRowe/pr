class DefineField

  def on klass, field_name, field
    var_name     = "@field_#{field_name}"
    field_setter = "#{field_name}="

    klass.class_eval do
      define_method(field_name) do
        (
          instance_variable_get(var_name) ||
          instance_variable_set(var_name,field.new)
        ).raw
      end
      define_method(field_setter) do |value|
        instance_variable_set var_name, field.new(value)
      end
    end
  end

  private
    def var name
      "@field_#{name}"
    end

end
