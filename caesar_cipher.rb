def caesar_cipher(message, shift)
    ciphered = message.split("").reduce(Array.new()) do |result, character|
        # only rotate if it is a letter, otherwise skip it
        if /[A-Za-z]/ =~ character then
            # get numerical value and shift it
            num_equivalent = character.ord + shift

            # if shift is negative, we should go the other way to wrap z->a
            shift.positive? ? wrap = -26 : wrap = 26

            # Separate evaluations for uppercase or lowercase letters
            if (character == character.upcase && !num_equivalent.between?(65, 90)) ||
                (character == character.downcase && !num_equivalent.between?(97, 122)) then 
                num_equivalent += wrap
            end
            # If we just check between?(65, 90) || between?(97, 122), the letter might
            # not wrap properly
            #  
            # i.e. 'Z'.ord == 90, so for any shift >= 7, 'Z' will pass the check after the
            # shift, but it will be the wrong case and wrong letter. For 'Z' with shift of 8, 
            # 'Z'.ord + shift == 98 which /is/ between 97-122, but 98.chr == 'b'. 'Z' shifted
            # by 8 should be 'H' (num_equivalent = 72) if we are preserving case when wrapping

            result.push(num_equivalent.chr)
        else
            result.push(character)
        end
    end

    ciphered.join("")
end

puts "What message should we put through the Caesar Cipher?"
message = gets.chomp

puts "How should we shift it?"
shift = 0
loop do
    shift = gets.chomp.to_i
    break unless shift == 0 || shift > 25 || shift < -25
    puts "Try again with a valid number"
end

puts caesar_cipher(message, shift)