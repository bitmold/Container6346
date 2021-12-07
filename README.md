#Ruby ISO6346 Validator

Work in progress gem to validate an <a href="https://en.wikipedia.org/wiki/ISO_6346#Calculation_step_1">ISO 6346 shipping container</a>.


##Usage 


```ruby
require 'container6346'
owner_code = "TOL"
category_identifier = "U"
serial_number = "473478"
check_digit = "7"

if Container6346.validate?(owner_code, category_identifier, serial_number, check_digit)
	puts "#{owner_code}#{category_identifer}#{serial_number}#{check_digit} is ISO 6346 compliant"
else
	puts "Contianer is not ISO 6346 compliant"
end

``` 

