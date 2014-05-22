setup do
  class Foo
    extend ValidatedAccessors
    validated_accessor :bar, valid: [:two, :three]
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
