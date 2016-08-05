
# Method that encrypts string
def encrypt message

	encrypted_message = ""

	for letter in message.each_char
		if letter == " "
			encrypted_message += letter
		else
			encrypted_message += letter.next
		end
	end
	
	encrypted_message
end

# Methods the decrypts string
def decrypt message

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
	decrypted_message
end

# encrypt("abc")
# encrypt("zed")
# decrypt("bcd")
# decrypt("afe")

# decrypt(encrypt("swordfish"))

# Asks user if they want to encrypt or decrypt
print "Would like to decrypt or encrypt a password: "
decrypt_or_encrypt = gets.chomp.downcase

until decrypt_or_encrypt == "encrypt" || decrypt_or_encrypt == "decrypt"
	print "INVALID ENTRY: Would like to decrypt or encrypt a password: "
	decrypt_or_encrypt = gets.chomp.downcase
end

# Asks user for password to encrypt or decrypt
print "Enter a password: "
password = gets.chomp

# Encrypt or decrypt password
if decrypt_or_encrypt == "encrypt"
	result = encrypt(password)
else
	result = decrypt(password)
end

puts result
