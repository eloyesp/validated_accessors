# Copyright (C) 2014 Eloy Espinaco, Gastón Ramos

module ValidatedAccessors

  VERSION = "0.0.1"

  def validated_accessor attribute, options

    define_method attribute do
      instance_variable_get "@#{ attribute }"
    end

    define_method "#{ attribute }=" do |value|
      value = yield value if block_given?
      raise ArgumentError unless options[:valid].include? value
      instance_variable_set "@#{ attribute }", value
    end

  end

end
