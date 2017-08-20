system("clear")

#1.Write a method that determines and returns the ASCII string value of a string
#that is passed in as an argument. The ASCII string value is the sum of the ASCII
#values of every character in the string. (You may use String#ord to determine
#the ASCII value of a character.)
def ascii_value(str)
  sum = 0
  str.chars.reduce(0){ |sum, ch| sum += ch.ord  }
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

#2.Given a string of words separated by spaces, write a method that takes this
#string of words and returns a string in which the first and last letters of
#every word is swapped.

#You may assume that every word contains at least one letter, and that the string
# will always contain at least one word. You may also assume that each string
#contains nothing but words and spaces

#STR.SPLIT NEEDS TO BE SAVED, BECAUSE IT POINTS TO A DIFFERENT SPOT IN MEMORY.
#ITS NOT THE ORIG STR ANYMORE.
def swap(str)
  #words = str.split
  s = str.split.each { |word| word[0], word[-1] = word[-1], word[0]}
  #words.join(" ")
  s.join(" ")
end

# def swap(string)
#   words = string.split(' ')
#
#   words.each do |word|
#     word[0], word[-1] = word[-1], word[0]
#   end
#
#   words.join(' ')
# end

# def swap_first_last_characters(word)
#    word[0], word[-1] = word[-1], word[0]
#    word
# end
#
# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word)
#   end
#   result.join(' ')
# end
# p swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') #== 'ebcdA'
# p swap('a') #== 'a'

#3.Given a string that consists of some words and an assortment of non-alphabeti
#c characters, write a method that returns that string with all of the non-alpha
#betic characters replaced by spaces. If one or more non-alphabetic characters
#occur in a row, you should only have one space in the result (the result should
# never have consecutive spaces).

# def cleanup(str)
#   #a = str.delete('^a-z" "').squeeze(" ")
#   p str.gsub(/[^a-z]/, ' ').squeeze(' ')
# end

#VERY SMART, doesnt need squeeze!!!!
#Instead of using squeeze, we can also use the + operator in the regex!!!
def cleanup(string)
  string.gsub!(/[^a-zA-Z]+/, ' ')
end
#No, String#tr_s works like String#tr, but it if there are any duplicate charact
#ers that got subbed in, then it removes them. In this case, it is replacing eve
#rything that is not a lowercase or uppercase letter with a space, then when tha
#t's finished, it changes any consecutive spaces to single spaces.

def cleanup(str)
  str.tr_s('^a-zA-Z', ' ')
end

#p cleanup("---what's my +*& line?") == ' what s my line '

#4.Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.
#Words consist of any string of characters that do not include a space.
def word_sizes(str)
  hash = str.split.group_by{ |word| word.size}
  p hash.map{ |k,v| :k=>v.size}
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}
