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
