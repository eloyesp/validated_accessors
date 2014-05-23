# -*- coding: utf-8 -*-
# Copyright (C) 2014 Eloy Espinaco, Gastón Ramos

# Extend a class with ValidatedAccessors to enable the functionality.
#
# @example
#   class Foo
#     extend ValidatedAccessors
#
#     validated_accessor :bar, valid: [:foo, :bar]
#
#     # a transformation can be applied to the accessor for consistency
#
#     validated_accessor(:age, valid: (18..100)) { |a| a.to_i }
#   end
#
#   foo = Foo.new
#   foo.bar = :foo # => error
#   foo.age = '24'
#   foo.age # => 24
module ValidatedAccessors

  VERSION = "0.1.1"

  def validated_accessor attribute, options, &block
    define_attribute_reader attribute
    define_attribute_writter attribute, options, &block
  end

  def check_valid_attribute attribute, value, options
    unless options[:valid].include? value
      raise ArgumentError,
      "Invalid value: #{ value } for #{ attribute }."\
      "(Valid values are: #{ options[:valid] })"
    end
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
      self.class.check_valid_attribute attribute, value, options
      instance_variable_set "@#{ attribute }", value
    end
  end

end
