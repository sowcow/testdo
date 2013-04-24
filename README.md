# ~~Testdo~~ (FAILed and I don't remove it because of laziness :smile:)

```ruby
# your code
a = 2

if __FILE__ == $0
require 'testdo'
test do
  # your expecations using === or Array#(all? any? ...)
  a + 1 === 3
  [1, a].any? { |x| x > 1 }
  /\d/ === a.to_s
  [1,2,2,3,3] - [1,2,3] === []
end
end
```
