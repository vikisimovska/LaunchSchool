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
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
