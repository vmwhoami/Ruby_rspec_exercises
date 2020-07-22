def no_dupes?(arr)
  h = Hash.new(0)
  arr.each { |el|  h[el] +=1 }
  h.select{|k,v| v == 1}.keys
end


def no_consecutive_repeats?(arr)
    arr.each_with_index do |el_1,indx_1|
        if indx_1 < arr.size - 1
           return false if el_1 == arr[indx_1+1]
        end
    end
true
end



def char_indices(str)
    h = Hash.new()
    str.each_char.with_index do |char,indx|
       h[char] = index_of(str,char)
    end
    h
end
#Helper function
def index_of(str,letter)
ar = []
str.each_char.with_index do |ch,i|
    ar << i if ch == letter
 end
 ar
end

##///////////////////

def longest_streak(str)
    h = Hash.new(0)
    str.each_char do |ch|
        h[ch] += 1
    end
   streak = h.values.max
  a = h.select{|k,v| v == streak}.to_a[-1]
  a[0]*a[1]
end

def bi_prime?(num)
  (1...num).each do |num_1|
    (1...num).each do |num_2|
     if (num_1*num_2 == num )&&(prime?(num_1)&&(prime?(num_2)))
        return true
     end
    end
  end
  false
end

def prime?(num)
    return false if num < 1
    return true if num == 2
    (2...num).each do |n|
       return false if num % n == 0
    end
    true
end



def vigenere_cipher(str,arr)
alph = ("a".."z").to_a
array = Array.new(str.size,[arr]).flatten
ac = nil
   arr.size > 1 ? ac = array.slice(0, array.size/2) : ac = array
ar = []
    str.each_char.with_index do |ch,indx|
    ar << alph[ (alph.index(ch) + ac[indx])%26]
    end
ar.join

end


def vowel_rotate(str)
end