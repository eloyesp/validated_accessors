# Copyright (C) 2014 Eloy Espinaco, Gastón Ramos

module ValidatedAccessors

  VERSION = "0.1"

  def validated_accessor attribute, options, &block
    define_attribute_reader attribute
    define_attribute_writter attribute, options, &block
  end

  private

  def define_attribute_reader attribute
    define_method attribute do
      instance_variable_get "@#{ attribute }"
    end
  end

  def define_attribute_writter attribute, options, &block
    define_method "#{ attribute }=" do |value|
      value = yield value if block_given?
      unless options[:valid].include? value
        raise ArgumentError,
          "Invalid value: #{ value } for #{ attribute }."\
          "(Valid values are: #{ options[:valid] })"
      end
      instance_variable_set "@#{ attribute }", value
    end
  end

end
