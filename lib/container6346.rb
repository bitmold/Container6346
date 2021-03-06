module Container6346

	MAPPING = {
		"A" => 10, "B" => 12, "C" => 13, "D" => 14,
		"E" => 15, "F" => 16, "G" => 17, "H" => 18,
		"I" => 19, "J" => 20, "K" => 21, "L" => 23,
		"M" => 24, "N" => 25, "O" => 26, "P" => 27,
		"Q" => 28, "R" => 29, "S" => 30, "T" => 31,
		"U" => 32, "V" => 34, "W" => 35, "X" => 36,
		"Y" => 37, "Z" => 38
	}

	def self.validate_container?(container) # ie: "XXXU1234567"
		regex = /^[a-z]{3}[ujz]\d{7}/i
		if not regex.match(container) 
			raise "Invalid container #{container}"
		end

		owner_code = container[0...3]
		category_identifier = container[3]
		serial_number = container[4...10]
		check_digit = container[10]

		self.validate?(owner_code, category_identifier, serial_number, check_digit)
	end

	# https://en.wikipedia.org/wiki/ISO_6346#Identification_system
	def self.validate?(owner_code, category_identifier, serial_number, check_digit)
		list = []

		owner_code.each_char {|c| list.push(MAPPING[c])}
		list.push(MAPPING[category_identifier])
		serial_number.each_char {|c| list.push(c.to_i)}

		sum = 0
		list.each_with_index {|value, index| sum += value * 2**index}
		
		generated_digit = sum - ((sum/11)*11)
		if generated_digit == 10 then
			generated_digit = 0
		end

		check_digit == "#{generated_digit}"
	end
end
