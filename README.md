# timecop.cr

Mock with `Time.now` with the power of time travel, time freeze and time scale.

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "waterlink/timecop.cr"
end
```

## Usage

```crystal
require "timecop"
```

### Time travel

*NOTE: Not implemented yet*

```crystal
Timecop.travel(2.days.ago)
# Do some stuff 2 days ago

Timecop.travel(4.days.from_now)
# Do some stuff 2 days from now (2 days ago + 4 days from now = -2 + 4 = +2)
```

Block form:

```crystal
# Normal time here

Timecop.travel(2.days.ago) do
  # Do some stuff 2 days ago
end

# Again back to normal time
```

### Time freeze

*NOTE: Not implemented yet*

```crystal
Timecop.freeze(2.days.ago)
# Do some stuff exactly 2 days ago
```

Block form:

```crystal
Timecop.freeze(2.days.ago) do
  # Time.now is always 2 days ago in this block
end
```

### Difference between time travel and time freeze

`Timecop.freeze` is used to statically mock the concept of now. As your program executes, `Time.now` will always return the same value - value you provided as an argument to `Timecop.freeze`.

On the other hand `Timecop.travel` is dynamically mocks `Time.now`, ie: as your program executes, `Time.now` will change accordingly taking into account offset created by `Timecop.travel`.

`Timecop.travel` and `Timecop.freeze` both support nested calls. *NOTE: Not implemented yet*

### Time scale

*NOTE: Not implemented yet*

```crystal
Timecop.scale(1000)
# Now time goes 1000 times faster

Timecop.scale(0.001)
# Now time goes as normal

Timecop.scale(0.001)
# Now time goes 1000 times slower
```

Block form:

```crystal
Timecop.scale(2.5) do
  # here time goes 2.5 times faster
end
```

### Resetting normal time flow

*NOTE: Not implemented yet*

```crystal
Timecop.reset
```

## Development

Just use normal `crystal spec` TDD cycle.

## Contributing

1. Fork it ( https://github.com/waterlink/timecop.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [waterlink](https://github.com/waterlink) Oleksii Fedorov - creator
