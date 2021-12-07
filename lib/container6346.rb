module Container6346

	MAPPING = {
		"A" => 10,
		"B" => 12,
		"C" => 13,
		"D" => 14,
		"E" => 15,
		"F" => 16,
		"G" => 17,
		"H" => 18,
		"I" => 19,
		"J" => 20,
		"K" => 21,
		"L" => 23,
		"M" => 24,
		"N" => 25,
		"O" => 26,
		"P" => 27,
		"Q" => 28,
		"R" => 29,
		"S" => 30,
		"T" => 31,
		"U" => 32,
		"V" => 34,
		"W" => 35,
		"X" => 36,
		"Y" => 37,
		"Z" => 38
	}

	def self.validate?(owner_code, category_identifier, serial_number, check_digit)
		if not owner_code.length == 3
			raise "Invalid owner code"
		end
		owner_code
		if not category_identifier.length == 1 # todo ...
			raise "Invalid category identifier "
		end
		if not self.only_digits?(serial_number) or serial_number.length != 6
			raise 'Invalid serial number'
		end
		if not self.only_digits?(check_digit) or check_digit.length != 1
			raise 'Invalid Check digit'
		end


		list = []

		owner_code.each_char do |c|
			list.push(MAPPING[c])
		end

		list.push(MAPPING[category_identifier])

		serial_number.each_char do |c| 
			list.push(c.to_i)
		end


		sum = 0
		list.each_with_index do |value, index|
			sum += value * 2**index
		end
		
		generated_digit = sum - ((sum/11)*11)
		if generated_digit == 10 then
			generated_digit = 0
		end


		check_digit == "#{generated_digit}"

	end


	def self.only_digits?(string)
		string !~ /\D/
	end
end
