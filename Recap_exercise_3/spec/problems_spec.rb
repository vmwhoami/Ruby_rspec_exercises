require "problems"

describe "no_dupes?" do
    it "returns an new array containing the elements that were not repeated" do
        expect(no_dupes?([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
        expect(no_dupes?(['x', 'x', 'y', 'z', 'z'])).to eq(["y"])
        expect(no_dupes?([true, true, true])).to eq([])
    end
end

describe "no_consecutive_repeats?" do
    it "The method should return true if an element never appears consecutively in the array" do
        expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
        expect(no_consecutive_repeats?(['x', 'x', 'y', 'z', 'z'])).to eq(false)
    end
    it "true if an element never appears consecutively in the array"  do
        expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)
        expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false)
        expect(no_consecutive_repeats?(['x'])).to eq(true)
    end

end

describe "char_indices" do

    it "should return a hash containing characters as keys." do
        expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
    end
    it "each key should be an array containing the indices where that character is found." do
        expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
    end

end


describe "longest_streak" do
    it "The method should return the longest streak of consecutive characters in the string" do
        expect(longest_streak('a')).to eq('a')
        expect(longest_streak('accccbbb')).to eq('cccc')
        expect(longest_streak('aaaxyyyyyzz')).to eq('yyyyy')
    end
        it "If there are any ties, return the streak that occurs later in the string." do
        expect(longest_streak('aaabbb')).to eq('bbb')
        expect(longest_streak('abc')).to eq('c')
    end
end


describe "bi_prime?" do
    it "returns a boolean indicating whether or not the number is a bi-prime" do
        expect(bi_prime?(14)).to eq(true)
        expect(bi_prime?(22)).to eq(true)
        expect(bi_prime?(25)).to eq(true)
        expect(bi_prime?(94)).to eq(true)
    end
    it "a positive integer that can be obtained by multiplying two prime numbers" do
        expect(bi_prime?(24)).to eq(false)
        expect(bi_prime?(64)).to eq(false)
    end
end

describe "vigenere_cipher" do
    it "A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used." do
        expect(vigenere_cipher("toerrishuman", [1]) ).to eq("upfssjtivnbo")
        expect(vigenere_cipher("toerrishuman", [1, 2]) ).to eq("uqftsktjvobp")
        expect(vigenere_cipher("toerrishuman", [1, 2, 3]) ).to eq("uqhstltjxncq")
        expect(vigenere_cipher("zebra", [3, 0]) ).to eq("ceerd")
        expect(vigenere_cipher("yawn", [5, 1]) ).to eq("dbbo")
    end
end


 describe "vowel_rotate" do
    it "The first vowel of the string should be replaced with the last vowel"   do
        expect(vowel_rotate('computer') ).to eq("cempotur")     # => "cempotur"
        expect(vowel_rotate('oranges') ).to eq("erongas")      # => "erongas"
        expect(vowel_rotate('headphones')).to eq("heedphanos")    # => "heedphanos"
        expect(vowel_rotate('bootcamp')).to eq("baotcomp")      # => "baotcomp"
        expect(vowel_rotate('awesome')).to eq("ewasemo")       # => "ewasemo"
    end
 end

 describe 'String' do

    describe '#select' do
            let(:str_a){ "app academy"}
            let(:str_b){ "HELLOworld"}
        context "When no block is given" do
            it "should return an epty string" do
            expect(str_a.select).to eq("") 
            end
        end

        it "select elements that return true in the block" do
            expect(str_a.select{ |ch| !"aeiou".include?(ch) }).to eq("pp cdmy")   
            expect(str_b.select{ |ch| ch == ch.upcase }).to eq("HELLO")   
        end
    end

 end