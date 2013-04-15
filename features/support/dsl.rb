require 'pr'

module DSL

  def run_test code
    world.run code
  end

  def setup_test code
    world.load code
  end

  alias define_field setup_test
  alias define_form  setup_test
  alias define_model run_test

  def define_hash code
    world.instance_variable_set '@hash', world.run(code)
  end

  def fetch klass
    world.class.const_get klass
  end

  def access var
    world.instance_variable_get var
  end

  def world
    @world ||= world_klass.new
  end

  def world_klass
    Class.new do
      def load code
        self.class.class_eval code
      end

      def run code
        self.instance_eval code
      end
    end
  end

  def set thing, attribute, value
    thing.send "#{attribute}=", value
  end

end
World DSL
