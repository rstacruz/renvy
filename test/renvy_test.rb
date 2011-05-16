require File.expand_path('../../lib/renvy', __FILE__)

class REnvyTest < Test::Unit::TestCase
  def test_should
    2.should   == 2
    2.should_not == 3

    2.should   != 3
    2.should_not != 2

    "hi".should =~ /hi/
    "hi".should_not =~ /HI/

    true.should.be.true!
    "ye".should.be.true!
    true.should_not.be.false!

    false.should.be.false!
    false.should_not.be.true!

    @foo.should.be.nil?
    1000.should_not.be.nil?

    "".should.respond_to?(:empty?)
    "".should_not.respond_to?(:lolwhat)

    should_not.raise { 2 + 2 }
    should.raise(ZeroDivisionError) { 2 / 0 }

    [].should.be.empty?
    [].should.empty?

    [1].should_not.be.empty?
    [1].should.include?(1)

    2.should < 3
    1.should < 2
    2.should <= 2
    2.should <= 4
    4.should >= 4
    4.should >= 3

    Object.new.should.respond_to?(:freeze)
    Object.new.should.be.kind_of?(Object)
    Object.new.should.be.instance_of?(Object)

    a = Object.new
    b = a
    a.should.be.equal?(b)
    a.should_not.be.equal?(Object.new)

    Math::PI.should.be.in_delta?(22.0/7, 0.1)
  end
end
