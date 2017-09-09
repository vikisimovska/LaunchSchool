system("clear")
#1.Longest Sentence & num of words
text = File.read('/Users/violetasimovska/LaunchSchool/textFile')
line = text.split(/[.!?]/)
largest_sentence = line.max_by{|sentence| sentence.size}.strip
largest_sentence.split.size

#SOLUTION 2 WITH MAP
sentences = File.read("longest_sentence.txt").split(/[.!?]/)
sentence_lengths = sentences.map { |sentence| sentence.split.length }
largest_length = sentence_lengths.max
pusentences[sentence_lengths.index(largest_length)].gsub("\n", ' ').strip

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

#2.
