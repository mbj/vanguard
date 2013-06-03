vanguard
========

This library provides external validations for any Ruby class.

History:
--------

It originates from [emmanuels vanguard repository](https://github.com/emmanuel/vanguard)
with the following changes:

* Only support for external validators
* Use composable algebra for internals
* Will allow serialization to javascript for client side validation (not implemented)
* No contextual validators anymore (use additional external validators)
* Use [equalizer](https://github.com/dkubb/equalizer) and [adamantium](https://github.com/dkubb/adamantium) where possible.

## Specifying Validations

```ruby
require 'vanguard'

class ProgrammingLanguage
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

VALIDATOR = Vanguard::Validator.build do
  validates_presence_of :name
end

ruby = ProgrammingLanguage.new('ruby')

result = VALIDATOR.call(ruby)
result.valid? # => true
result.violations # => #<Set: {}>

other = ProgrammingLanguage.new('')

result = VALIDATOR.call(other)
result.valid? # => false
result.violations # => #<Set: {<Vanguard:::Violation ....>}>
```

See `Vanguard::Macros` to learn about the complete collection of validation rules available.

## Validating

Vanguard validations may be manually evaluated against a resource using the
`Vanguard::Result#valid?` method, which will return `true` if the resource is valid, and `false` if it is invalid.

## Credits

* Markus Schirp [mbj](https://github.com/mbj)
* Emmanuel Gomez [emmanuel](https://github.com/emmanuel)

## Working with Validation Errors

If an instance fails one or more validation rules, `Vanguard::Violation` instances
will populate the `Vanguard::ViolationSet` object that is available through
the `Vanguard::Result#violations` method.

For example:

```ruby
result = YOUR_VALIDATOR.call(Account.new(:name => "Jose"))
if result.valid?
  # my_account is valid and can be saved
else
  result.violations.each do |e|
    puts e
  end
end
```

See `Vanguard::ViolationSet` for all you can do with the `#violations` method.

##Contextual Validation

Vanguard does not provide a means of grouping your validations into
contexts. Define a validator per context for this.
