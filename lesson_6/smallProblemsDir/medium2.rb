system("clear")
#1.Longest Sentence & num of words
text = File.read('/Users/violetasimovska/LaunchSchool/textFile')
line = text.split(/\.|\?|!/)
p largest_sentence = line.max_by{|sentence| sentence.size}.strip
p largest_sentence.split.size
p largest_sentence.size
