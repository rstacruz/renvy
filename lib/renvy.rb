require 'test/unit'

# Rspec-like matching for Test::Unit.
#
# == Usage
#
#   obj.should == 2
#   obj.should ~= /regex/
#   obj.should != 3
#   obj.should.be.true!
#   obj.should.be.false!
#
#   # Anything else will just pass thru:
#   obj.should.nil?     # same as: assert obj.nil?
#   obj.should.be.nil?  # same as: assert obj.nil?
#   obj.should.respond_to?(:freeze)
#
#   # You can also use shouldnt:
#   obj.shouldnt == 3
#   obj.shouldnt.be.nil?
#
#   should.raise(Error) { lol }
#   shouldnt.raise { puts "hi" }
#
module REnvy
  VERSION = "0.1.0"

  def self.version
    VERSION
  end

  class Should
    attr_reader :left

    def self.init(test)
      @@test = test
    end

    def self.add(extension)
      self.send :include, extension
    end

    def initialize(left, neg=false)
      @left = left
      @neg  = neg
    end

    def negative?
      @neg
    end

    def positive?
      !@neg
    end

    def test
      @@test
    end

    def ==(right)
      if positive?
        test.send :assert_equal, right, left
      else
        test.send :assert_not_equal, right, left
      end
    end

    def !=(right)
      if positive?
        test.send :assert_not_equal, right, left
      else
        test.send :assert_equal, right, left
      end
    end

    def =~(right)
      if positive?
        test.send :assert_match, right, left
      else
        test.send :assert, ! (left =~ right)
      end
    end

    def be
      Be.new(left, @neg)
    end

    def raise(ex=StandardError, &blk)
      if positive?
        test.send :assert_raises, ex, &blk
      else
        test.send :assert_nothing_raised, &blk
      end
    end

    def method_missing(meth, *args, &blk)
      result = left.send(meth, *args, &blk)
      if positive?
        @test.send :assert, result
      else
        @test.send :assert, ! result
      end
    end
  end

  class Should::Be < Should
    def true!
      if positive?
        test.send :assert, left
      else
        test.send :assert, ! left
      end
    end

    def false!
      if positive?
        test.send :assert, ! left
      else
        test.send :assert, left
      end
    end
  end
end

class Object
  def should
    REnvy::Should.new(self)
  end

  def shouldnt
    REnvy::Should.new(self, true)
  end
end

class Test::Unit::TestCase
  alias old_setup setup
  def setup(&blk)
    old_setup &blk
    REnvy::Should.init self
  end
end
