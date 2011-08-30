v0.3.0 - Aug 31, 2011
---------------------

### Changed:
  * Account for assert_includes missing in old Test::Unit versions.
  * Use a new way of hooking onto Test::Unit should now not break setup blocks.

v0.2.3 - Jul 27, 2011
---------------------

### Fixed:
  * Fixed `should.include`

v0.2.2 - May 17, 2011
---------------------

### Added:
  * Messages (#blaming and #messaging)

v0.2.1 - May 17, 2011
---------------------

Massive API overhaul to match Test::Spec API.

v0.1.3 - May 17, 2011
---------------------

### Fixed:
  * Fixed operations (`a.should < b` and so on)

v0.1.2 - May 17, 2011
---------------------

### Added:
  * Added `in_delta?` and `in_eplison?` for floats.

### Changed:
  * Doing `include?`, `instance_of?`, `equal?` and so on will use the 
  appropriate MiniTest matchers instead of generic asserts.

v0.1.1 - May 17, 2011
---------------------

Initial version.
