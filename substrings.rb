=begin 

Implement a method #substrings that takes a word as the first argument and then an array of valid substrings 
(your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) 
that was found in the original string and how many times it was found.

  > dictionary = ["below", "down", "go",
                  "going", "horn", "how",
                  "howdy", "it",   "i",
                  "low",   "own",  "part",
                  "partner", "sit"]

  > substrings("below", dictionary)
  => { "below" => 1, "low" => 1 }

Next, make sure your method can handle multiple words:

  > substrings("Howdy partner, sit down! How's it going?", dictionary)
  => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, 
       "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
Please note the order of your keys might be different.

=end

def substrings(string, dictionary)

    dictionary.reduce(Hash.new(0)) do |hash_count, word| 
        if string.downcase.include? word.downcase then
            hash_count[word] += string.downcase.scan(word.downcase).length
        end

        hash_count
    end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)