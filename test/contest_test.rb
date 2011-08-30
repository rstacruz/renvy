require File.expand_path('../../lib/renvy', __FILE__)
require 'contest'

class Test::Unit::TestCase
  setup do
    @x = 1
  end

  test "x" do
    @x.should == 1
  end
end
