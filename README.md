# REnvy
#### Rspec-like matching for Test::Unit.

REnvy lets you use a syntax similar to RSpec on your Test::Unit tests.

```
$ gem install renvy
```

Then you may use it as so:

```ruby
obj.should == 2
obj.should ~= /regex/
obj.should != 3
obj.should.be.true!
obj.should.be.false!

# Anything else will just pass thru:
obj.should.nil?     # same as: assert obj.nil?
obj.should.be.nil?  # same as: assert obj.nil?
obj.should.respond_to?(:freeze)

# You can also use shouldnt:
obj.shouldnt == 3
obj.shouldnt.be.nil?

should.raise(Error) { lol }
shouldnt.raise { puts "hi" }
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
