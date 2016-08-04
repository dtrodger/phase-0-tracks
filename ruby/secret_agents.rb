
def encrypt()

	print "word to encrypt: "
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

encrypt()