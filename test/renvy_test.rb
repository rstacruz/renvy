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
  end
end
