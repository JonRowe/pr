class DefineField

  def on klass, field_name, field
    var_name     = "@field_#{field_name}"
    field_setter = "#{field_name}="
    actual_field = "__#{field_name}"

    klass.class_eval do
      define_method(actual_field) do
        instance_variable_get(var_name) || send(field_setter,nil)
      end
      define_method(field_name) do
        send(actual_field).raw
      end
      define_method(field_setter) do |value|
        instance_variable_set var_name, field.new(*([value].compact))
      end
    end
  end

  private
    def var name
      "@field_#{name}"
    end

end
