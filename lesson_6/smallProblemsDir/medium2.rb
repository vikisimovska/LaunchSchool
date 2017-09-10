system("clear")
#1.Longest Sentence & num of words
text = File.read('/Users/violetasimovska/LaunchSchool/textFile')
line = text.split(/[.!?]/)
largest_sentence = line.max_by{|sentence| sentence.size}.strip
largest_sentence.split.size

#SOLUTION 2 WITH MAP(not that important)
sentences = File.read('/Users/violetasimovska/LaunchSchool/textFile').split(/[.!?]/)
sentence_lengths = sentences.map { |sentence| sentence.split.length }
largest_length = sentence_lengths.max
sentences[sentence_lengths.index(largest_length)].gsub("\n", ' ').strip

#SOLUTION 3
def longest_sentence(file)
  # split by one or more spaces after a sentence-ending punctuation mark
  sentences.max_by { |sentence| sentence.split(/\s+/).size }
  sentences = File.read(file).split(/(?<=[.!?])\s+/)
end

def longest_paragraph(file)
  paragraphs = File.read(file).split(/\n\n/)
  paragraphs.max_by { |paragraph| paragraph.split(/\s+/).size }
end

def word_count(string)
  string.split(/\s+/).size
end

def longest_word(file)
  words = File.read(file).split(/\W+/)
  words.max_by { |word| word.size }
end

#2.A collection of spelling blocks has two letters per block, as shown in this
#list. A collection of spelling blocks has two letters per block, as shown in
#this list.Write a method that returns true if the word passed in as an argument
# can be spelled from this set of blocks, false otherwise.
 BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)
def block_word?(word)
  BLOCKS.each{ |b| return false if word.include?(b[0])  &&  word.include?(b[1])}
  true
end

#SOLUTION 2
def block_word?(s)
  %w[BO XK DQ CP NA GT RE FS JW HU VI LY ZM].none? { |b| s.upcase.count(b) > 1 }
end
def block_word?(w)
 %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).all? { |b| w.upcase.count(b) <= 1 }
end

# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

#3.Write a method that takes a string, and then returns a hash that contains 3
#entries: one represents the percentage of characters in the string that are
#lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.
def letter_percentages(str)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  count_downcase = str.chars.count{ |char| char =~ /[a-z]/ }
  count_upcase = str.chars.count{ |char| char =~ /[A-Z]/ }

  hash[:lowercase] = (count_downcase * 100) / str.size.to_f
  hash[:uppercase] = (count_upcase * 100) /str.size.to_f
  hash[:neither] = 100 - (hash[:lowercase] + hash[:uppercase])
  hash
end

#OTHER SOLUTIONS:
def letter_percentages(str)
  hsh = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  hsh.transform_values { |pattern| str.count(pattern).fdiv(str.size) * 100 }
end

def letter_percentages(str)
  %i[lowercase uppercase neither].zip(%w[a-z A-Z ^a-zA-Z]).map do |type, pat|
    [type, str.count(pat).fdiv(str.size) * 100]
  end.to_h
end

def letter_percentages(str)
  regs = [/[[:lower:]]/, /[[:upper:]]/]
  lower, upper = regs.map { |reg| (str.scan(reg).size.to_f * 100 / str.size).round(1) }
  {lowercase: lower, uppercase: upper, neither: (100 - lower - upper)}
end

def letter_percentages(str)
  hash = {}
  hash[:lowercase] = (str.scan(/[a-z]/).count / str.size.to_f) * 100
  hash[:uppercase] = (str.scan(/[A-Z]/).count / str.size.to_f) * 100
  hash[:neither] = (str.scan(/[^a-z]/i).count / str.size.to_f) * 100
  hash
end

def percentage(string, pattern)
  (string.scan(pattern).size / string.size.to_f) * 100
end

def letter_percentages(string)
  {
    lowercase: percentage(string, /[a-z]/),
    uppercase: percentage(string, /[A-Z]/),
    neither:   percentage(string, /[^A-Za-z]/)
  }
end
def letter_percentages(string)
  upper = *('A'..'Z')
  lower = *('a'..'z')
  counter = Hash.new(0)

  string.chars.each do |letter|
    counter[:lowercase] += ((lower.count(letter) / string.length.to_f) * 100)
    counter[:uppercase] += ((upper.count(letter)/ string.length.to_f) * 100)
  end

  counter[:neither] = 100 - (counter[:uppercase] + counter[:lowercase])
  counter
end

def letter_percentages(string)
  total = string.size.to_f

  lower_percent = string.count('a-z') / total * 100
  upper_percent = string.count('A-Z') / total * 100
  neither_percent = string.count('^(a-zA-Z)') / total * 100

  {lowercase: lower_percent, uppercase: upper_percent, neither: neither_percent}
end

def letter_percentages(str)
    hsh = {
    :lowercase => (str.delete('^a-z').size / str.size.to_f)*100,
    :uppercase => (str.delete('^A-Z').size / str.size.to_f)*100,
    :neither => (str.delete("a-zA-Z").size / str.size.to_f)*100
    }
end
# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

#4.Write a method that takes a string as argument, and returns true if all
#parentheses in the string are properly balanced, false otherwise. To be properly
#balanced, parentheses must occur in matching '(' and ')' pairs.
def balanced?(str)
  arr = str.chars.select{ |ch| ch == '(' || ch == ')'}
  result = []

  arr.each do |parentheses|
   if parentheses == '('
       result << '('
   elsif parentheses == ')' && !result.empty?
      result.pop
    else
      return false
    end
  end
  result.empty?
end

#another SOLUTIONS
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

#5.A triangle is classified as follows:

#equilateral All 3 sides are of equal length
#isosceles 2 sides are of equal length, while the 3rd is different
#scalene All 3 sides are of different length
#To be a valid triangle, the sum of the lengths of the two shortest sides must be
# greater than the length of the longest side, and all sides must have lengths
#greater than 0: if either of these conditions is not satisfied, the triangle is
# invalid.

#Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
#on whether the triangle is equilateral, isosceles, scalene, or invalid.
def triangle(n1, n2, n3)
  sum_of_shorter_sides = [n1, n2, n3].sort[0..1].reduce(:+)
  if sum_of_shorter_sides > [n1, n2, n3].max
     if n1 == n2 && n1 == n3
       :equilateral
     elsif n1 == n2 || n1 == n3 || n2 == n3
       :isosceles
     else
       :scalene
     end
  else
    :invalid
  end
end

#other SOLUTIONS
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

#A triangle's two smaller sides should be greater than the length of the largest.
# The thing is, we don't know which of our sides was chosen as the "largest" when
# we call max on sides. So, to check for this, we make sure that the total sum
#of the side lengths is greater than 2 times the largest side. Another way to
#express this would be: largest_side > sides.reduce(:+) - largest_side
def triangle(side_one, side_two, side_three)
  ary = [side_one, side_two, side_three].sort
  return :invalid if ary[2] > ary[0] + ary[1] || ary.any? {|num| num <= 0 }
  ary.uniq.size == 1 ? :equilateral : ary.uniq.size == 2 ? :isosceles : :scalene
end

def triangle(*sides)
  sides.sort!

  if sides[0..1].sum <= sides[2] || sides.include?(0)
    return :invalid
  else
    sides.each do |side|
      return :equilateral if sides.count(side) == 3
      return :isosceles if sides.count(side) == 2
    end
    :scalene
  end
end

  def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if sides.include?(0)
  return :invalid if sides.min(2).reduce(&:+) < sides.max
  case sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    else        :scalene
  end
end
# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

#6.
#right One angle of the triangle is a right angle (90 degrees)
#acute All 3 angles of the triangle are less than 90 degrees
#obtuse One angle is greater than 90 degrees.
#To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
# all angles must be greater than 0: if either of these conditions is not satisfied,
# the triangle is invalid.

#Write a method that takes the 3 angles of a triangle as arguments, and returns
#a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
#is a right, acute, obtuse, or invalid triangle.
def triangle(s1, s2, s3)
  ary = [s1, s2, s3]
  return :invalid if ary.sum != 180 || [s1, s2, s3].any?{|s| s <= 0}

  if ary.all?{ |s| s < 90 }
   :acute
  elsif ary.include?(90)
    :right
  else
    :obtuse
  end
end

#BETTER SOLUTIONS
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

#7.Write a method that returns the number of Friday the 13ths in the year given
#by an argument.
#Ruby's Date class may be helpful here.
#Look at how to initialize a Date object
#Look at the friday? method
require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

#OTHER SOLUTIONS
def friday_13th(year)
  counter = 0
  (1..12).each do |month|
    t = Time.new(year, month, 13)
    counter += 1 if t.friday?
  end
  counter
end
#******
require 'date'

def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end
#******
def friday_13th?(year)
  (1..12).reduce(0) { |sum, m| Time.new(year, m, 13).friday? ? sum + 1 : sum }
end
#*****FURTHER EXPLORATIONS****
def lucky_days(year)
  (1..12).map { |m| Time.new(year, m, 7).strftime('%A') }
end

def second_to_last_days_of_month(year)
  last_days = (2..12).map { |month| Date.new(year, month, 1) - 2 }
  last_days += [Date.new(year + 1, 1, 1) - 2]
  last_days.map { |day| (day).strftime('%A %m-%d') }.join(', ')
end

#8.A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
#multiple of 7), and 133 is not (the digit 3 appears twice).
def featured(n)
  star_num = (n / 7) + 1
  while true
    result = star_num * 7
    if result.odd? && (result.to_s.chars.uniq == result.to_s.chars)
      return result
    else
      star_num += 1
    end
  end
end
#their SOLUTIONS
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end
# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

#p featured(9_999_999_999) # -> There is no possible number that fulfills those
#requirements

#9.Bubble Sort
def bubble_sort!(array)
need_swaps = true
  while need_swaps
    need_swaps = false
    array.each_index do |i|
      if (array[i+1] != nil) && (array[i] > array[i+1])
        array[i], array[i+1] = array[i+1], array[i]
        need_swaps = true
      end
     end
  end
 array
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

#10.Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n positive integers.
def sum_square_difference(n)
  p ((1..n).sum ** 2 )
end

p sum_square_difference(3) == 22 # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
