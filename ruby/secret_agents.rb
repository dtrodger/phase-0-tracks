
def encrypt

	print "Word to encrypt: "
	message = gets.chomp

	encrypted_message = ""

	for letter in message.each_char
		if letter == " "
			encrypted_message += letter
		else
			encrypted_message += letter.next
		end
	end

	print encrypted_message
end

def decrypt

	print "\nWord to decrypt: "
	message = gets.chomp

	alpha = "abcdefghijklmnopqrstuvwxyz"

	decrypted_message = ""

	for letter in message.each_char
		if letter == " "
			decrypted_message += letter
		else
			alpha_index = alpha.index(letter)
			alpha_index -= 1
			letter = alpha[alpha_index]
			decrypted_message += letter
		end
	end

	print decrypted_message
end

encrypt

decrypt