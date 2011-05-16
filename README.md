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
obj.should =~ /regex/              # => assert_match /regex/, obj
obj.should != 3                    # => assert_not_equal 3, obj
obj.should.nil                     # => assert_nil obj
obj.should.respond_to(:freeze)     # => assert_respond_to obj, :freeze 

# Note that .be, .a and .an are optional.
obj.should.nil                     # => assert_nil obj
obj.should.be.nil                  # => assert_nil obj
obj.should.be.a.nil                # => assert_nil obj

# You can also use should_not:
obj.should_not == 3
obj.should_not.be.nil?

# Anything else will pass through with a ?:
obj.should.be.good_looking         # => assert obj.good_looking?

should.raise(Error) { lol }
should_not.raise { puts "hi" }
```

## Wrapped assertions

These are based from Test::Spec.

| Test::Unit                  | REnvy                                 |
|-----------------------------|---------------------------------------|
| assert_equal                | should.equal, should ==               |
| assert_not_equal            | should.not.equal, should.not ==       |
| assert_same                 | should.be                             |
| assert_not_same             | should.not.be                         |
| assert_nil                  | should.be.nil                         |
| assert_not_nil              | should.not.be.nil                     |
| assert_in_delta             | should.be.close                       |
| assert_match                | should.match, should =~               |
| assert_no_match             | should.not.match, should.not =~       |
| assert_instance_of          | should.be.an.instance_of              |
| assert_kind_of              | should.be.a.kind_of                   |
| assert_respond_to           | should.respond_to                     |
| assert_raise                | should.raise                          |
| assert_nothing_raised       | should.not.raise                      |
| assert_throws               | should.throw                          |
| assert_nothing_thrown       | should.not.throw                      |
| assert_block                | should.satisfy                        |

## Extending

Need to create your own matchers? Create your new matcher in a module, then 
use `REnvy::Should.add`.

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

## REnvy vs. Test::Spec

[Test-Spec](http://test-spec.rubyforge.org/test-spec/) accomplishes roughly 
the same thing as REnvy, but:

 * REnvy does it with lean <4kb code.

 * REnvy can play alongside with other Test::Unit wrappers. In fact, is made 
to be used with gems like Contest, Shoulda, and other similar tools.

 * REnvy does not provide contexts or 'should'-like syntax like Test::Spec 
 does.  For that, I suggest using REnvy alongside 
 [Contest](http://github.com/citrusbyte/contest).
