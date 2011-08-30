require File.expand_path('../../lib/renvy', __FILE__)
require 'mocha'

class IncludeTest < Test::Unit::TestCase
  def test_should_include
    "abc".should.include "b"
  end

  def test_should_include_fail
    self.expects(:assert).with { |a, b| a == false && b =~ /Expected/ }
    "axxc".should.include "b"
  end
end
