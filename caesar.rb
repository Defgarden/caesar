

def caesar_cipher(input, size)
	letters = ('a'..'z').to_a
	uppers = ('A'..'Z').to_a
	i = 1
	numbers = []
	letters.each do |letter|
		letter = i
		i = i + 1
		numbers.push(letter)
	end

	h = Hash[numbers.zip letters]
	j = Hash[letters.zip numbers]
	output = []
	num = 0
	input.split('').each do |letter|

		if letters.include?(letter)
			num = j[letter] + size
			upper = false
		elsif uppers.include?(letter)
			num = j[letter.downcase!] + size
			upper = true
		else
			punct = true
		end

		if num > 26
			num = num - 26
		end

		if upper == true
			output.push(h[num].upcase!)
		elsif punct == true
			output.push(letter)
		else
			output.push(h[num])
		end
	end
	puts output.join("")
end

caesar_cipher("What a string!", 5)