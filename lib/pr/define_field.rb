class DefineField
  class << self
    def on klass, field_name, field, options = {}
      new.on klass, field_name, field, options
    end
    def [] klass, field_name, field, options = {}
      new.on klass, field_name, field, options
    end
  end

  def on klass, field_name, field, options = {}
    var_name     = "@field_#{field_name}"
    field_setter = "#{field_name}="
    actual_field = "__#{field_name}"

    define_field  klass, actual_field, var_name, field_setter
    define_reader klass, field_name, actual_field
    define_setter klass, var_name, field_setter, field
  end

  private
    def var name
      "@field_#{name}"
    end

    def define_field klass, actual_field, var_name, field_setter
      klass.class_eval do
        define_method(actual_field) do
          instance_variable_get(var_name) || send(field_setter,nil)
        end
      end
    end

    def define_reader klass, field_name, actual_field
      klass.class_eval do
        define_method(field_name) do
          send(actual_field).raw
        end
      end
    end

    def define_setter klass, var_name, field_setter, field
      klass.class_eval do
        define_method(field_setter) do |value|
          instance_variable_set var_name, field.new(*([value].compact))
        end
      end
    end

end
