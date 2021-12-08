# Ruby ISO 6346 Validator
Gem to validate an <a href="https://en.wikipedia.org/wiki/ISO_6346#Calculation_step_1">ISO 6346 shipping container</a>.


## Usage 

```bash
gem install container6346
```


```ruby
require 'container6346'
container = 'TOLU4734787'
if Container6346.validate_container?(container)
	puts '#{container} is ISO 6346 compliant'
else
	puts '#{container} is not ISO 6346 compliant'
end

``` 

