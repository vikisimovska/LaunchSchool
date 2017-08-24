system("clear")

#1.Write a method that combines two Arrays passed in as arguments, and returns a
#new Array that contains all elements from both Array arguments, with the
#elements taken in alternation.
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end
#p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

#2.Write a method that takes a string, and then returns a hash that contains 3
#entries: one represents the number of characters in the string that are
#lowercase letters, one the number of characters that are uppercase letters,
#and one the number of characters that are neither.

def letter_case_count(str)
  hash = { lowercase: 0,
           uppercase: 0,
           neither: 0 }
  str.chars do |ch|
    if ch.match(/[a-z]/)
      hash[:lowercase] += 1
    elsif
      ch.match(/[A-Z]/)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end
def letter_case_count(string)
  count = {}
  count[:lowercase] = string.count("a-z")
  count[:uppercase] = string.count("A-Z")
  count[:neither] = string.count("^a-zA-Z")
  count
end
def letter_case_count(string)
  string_counts = {}

  string_counts[:lowercase] = string.scan(/[a-z]/).size
  string_counts[:uppercase] = string.scan(/[A-Z]/).size
  string_counts[:neither] = string.scan(/[^a-zA-Z]/).size

  string_counts
end
#??????????????????????????????????????????????????????
# using Hash#transform_values (only works in Ruby 2.4+):
def letter_case_count(str)
  hsh = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  hsh.transform_values { |pattern| str.count(pattern) }
end
# p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

#3.Write a method that takes a single String argument and returns a new string
#that contains the original value of the argument with the first character of
#every word capitalized and all other letters lowercase.
def word_cap(str)
  str.split.map{ |word| word.capitalize}.join(" ")
end
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#We can use this shorthand syntax with any method that has no required arguments.

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

#4.Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
#lowercase letter by its uppercase version. All other characters should be
#unchanged.

#You may not use String#swapcase; write your own version of this method.
def swapcase(str)
  str.chars.map{ |ch| ch == ch.downcase ? ch.upcase : ch.downcase}.join
end
#???????????????????????????????????????????????????????????????????????
def swapcase(str)
  str.tr('A-Za-z', 'a-zA-Z')
end

def swapcase(str)
  str.gsub(/./){ |char| char[/[a-z]/] ? char.upcase : char.downcase }
end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

#5.Write a method that takes a String as an argument, and returns a new String
#that contains the original value using a staggered capitalization scheme in
#which every other character is capitalized, and the remaining characters are
#lowercase. Characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase.
def staggered_case(str)
  str.chars.map.with_index{ |ch, i| i.even? ? ch.upcase : ch.downcase }.join
end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

#6.Modify the method from the previous exercise so it ignores non-alphabetic
#characters when determining whether it should uppercase or lowercase each
#letter. The non-alphabetic characters should still be included in the return
#value; they just don't count when toggling the desired case.
def staggered_case(str, lower_case = false)
   str = str.tr(/[a-z]/i) do |ch|
     p ch
     lower_case = !lower_case
     lower_case ? ch.upcase : ch.downcase
 end
end

def staggered_case(str, lowercase = false)
  str.chars.map.with_index do |ch, i|
     if ch == ' '
       ' '
     elsif !lowercase && ch != ch.to_i.to_s
       lowercase = true
       ch.upcase
     elsif lowercase && ch != ch.to_i.to_s
       lowercase = !lowercase
       ch.downcase
     else
       ch
     end
  end.join
end

 # p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
 # p staggered_case('ALL CAPS') == 'AlL cApS'
 # p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

#7.Write a method that takes an Array of integers as input, multiplies all the
#numbers together, divides the result by the number of entries in the Array, and
# then prints the result rounded to 3 decimal places. Assume the array is non-empty.
def show_multiplicative_average(arr)
  a = arr.reduce(:*)/arr.size.to_f
  format('%.3f', a)
end

#8.Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
#pair of numbers from the arguments that have the same index. You may assume
#that the arguments contain the same number of elements.
# def multiply_list(arr1, arr2)
# arr1.zip(arr2).map { |arr| arr.reduce(:*) }
# end
def multiply_list(arr1, arr2)
  [arr1, arr2].transpose.map { |a, b| a * b }
end
# def multiply_list(*arrs)
#   arrs.transpose.map { |pair| pair.reduce(:*) }
# end

#p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

#9.Write a method that takes two Array arguments in which each Array contains a
#list of numbers, and returns a new Array that contains the product of every
#pair of numbers that can be formed between the elements of the two Arrays. The
#results should be sorted by increasing value.
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map{ |arr| arr.reduce(:*) }.sort
end

#p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

#10.Write a method that returns the next to last word in the String passed to it
# as an argument.

def penultimate(string)
    string.split[-2]
end
