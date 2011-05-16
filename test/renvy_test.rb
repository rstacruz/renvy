require File.expand_path('../../lib/renvy', __FILE__)

class REnvyTest < Test::Unit::TestCase
  def test_should
    2.should   == 2
    2.shouldnt == 3

    2.should   != 3
    2.shouldnt != 2

    "hi".should =~ /hi/
    "hi".shouldnt =~ /HI/

    true.should.be.true!
    "ye".should.be.true!
    true.shouldnt.be.false!

    false.should.be.false!
    false.shouldnt.be.true!

    @foo.should.be.nil?
    1000.shouldnt.be.nil?

    "".should.respond_to?(:empty?)
    "".shouldnt.respond_to?(:lolwhat)

    shouldnt.raise { 2 + 2 }
    should.raise(ZeroDivisionError) { 2 / 0 }
  end
end
