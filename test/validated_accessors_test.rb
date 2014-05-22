setup do
  class Foo
    extend ValidatedAccessors
    validated_accessor :bar, valid: [:two, :three]
    validated_accessor(:age, valid: (18..100)) { |a| a.to_i }
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
  foo.age = '22'
  assert foo.age == 22
end
