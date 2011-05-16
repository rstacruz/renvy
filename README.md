# REnvy
#### Rspec-like matching for Test::Unit.

REnvy lets you use a syntax similar to RSpec on your Test::Unit tests. It 
monkey-patches Object to translate RSpec-like sugar into plain Test::Unit 
`assert` matchers.

```
$ gem install renvy
```

Then you may use it as so:

```ruby
obj.should == 2                    # => assert_equal 2, obj
obj.should ~= /regex/              # => assert_match /regex/, obj
obj.should != 3                    # => assert_not_equal 3, obj
obj.should.be.true!                # => assert obj
obj.should.be.false!

# Anything else will just pass thru (.be is optional):
obj.should.nil?                    # => assert obj.nil?
obj.should.be.nil?                 # => assert obj.nil?
obj.should.respond_to?(:freeze)    # => assert obj.respond_to?(:freeze)

# You can also use should_not:
obj.should_not == 3
obj.should_not.be.nil?

should.raise(Error) { lol }
should_not.raise { puts "hi" }
```

### Extending

Create your new matcher in a module, then use `REnvy::Should.add`.

```ruby
module DanceMatcher
  def boogie_all_night!
    if positive?
      test.assert left.respond_to?(:dance)
    else
      test.assert ! left.respond_to?(:dance)
    end
  end
end

REnvy::Should.add DanceMatcher

# Then in your tests, use:
dancer.should.boogie_all_night!
```

(You may also use `REnvy::Should::Be.add` to restrict it to the `.should.be` 
 context.)
