module DSL

  class World
    require 'pr'

    def run code
      eval code
    end
  end


  def run_test code
    world.run code
  end
  alias define_form  run_test
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
    @world ||= Class.new(World).new
  end

  def set thing, attribute, value
    thing.send "#{attribute}=", value
  end

end
World DSL
