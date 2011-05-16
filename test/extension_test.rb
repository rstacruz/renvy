require File.expand_path('../../lib/renvy', __FILE__)

module REnvy::ArrayMatcher
  def like(right)
    super  unless left.is_a?(Array) && right.is_a?(Array)
    if positive?
      test.assert_equal left.sort, right.sort
    else
      test.assert_not_equal left.sort, right.sort
    end
  end
end

REnvy::Should.add REnvy::ArrayMatcher

class ExtensionTest < Test::Unit::TestCase
  def test_extension
    a = %w(a b c)
    b = %w(b c a)

    a.should.be.like b
  end

  def test_extension_2
    a = %w(a b c)
    b = %w(b c A)

    a.shouldnt.be.like b
  end

  def test_extension_3
    a = %w(a b c)
    b = 2

    should.raise(NoMethodError) { a.should.be.like b }
  end
end
