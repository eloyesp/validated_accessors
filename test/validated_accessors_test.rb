setup do
  class Foo
    extend ValidatedAccessors
    validated_accessor :bar, valid: [:two, :three]
    validated_accessor :sym_bar, valid: [:two, :three] { |v| v.to_sym }
  end
  Foo.new
end

test 'define accessor methods' do |foo|
  assert foo.respond_to? :bar
end

test 'let you assign valid values' do |foo|
  foo.bar = :two
  assert foo.bar == :two
end

test 'raise when you use assign invalid values' do |foo|
  assert_raise ArgumentError do
    foo.bar = :invalid
  end
end

test 'enforce the type provided' do |foo|
  foo.sym_bar = 'two'
  assert foo.sym_bar == :two
end
